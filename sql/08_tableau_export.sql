WITH patient_age_groups AS (
    SELECT
        id AS patient_id,
        CASE
            WHEN EXTRACT(YEAR FROM AGE(CURRENT_DATE, birthdate::date)) < 18 THEN 'Under 18'
            WHEN EXTRACT(YEAR FROM AGE(CURRENT_DATE, birthdate::date)) BETWEEN 18 AND 34 THEN '18-34'
            WHEN EXTRACT(YEAR FROM AGE(CURRENT_DATE, birthdate::date)) BETWEEN 35 AND 49 THEN '35-49'
            WHEN EXTRACT(YEAR FROM AGE(CURRENT_DATE, birthdate::date)) BETWEEN 50 AND 64 THEN '50-64'
            ELSE '65+'
        END AS age_group
    FROM patients
),

patient_counts AS (
    SELECT
        age_group,
        COUNT(*) AS patient_count
    FROM patient_age_groups
    GROUP BY age_group
),

claims_summary AS (
    SELECT
        pag.age_group,
        COUNT(c.id) AS claim_count
    FROM patient_age_groups pag
    JOIN claims c
        ON pag.patient_id = c.patientid
    GROUP BY pag.age_group
),

encounter_summary AS (
    SELECT
        pag.age_group,
        COUNT(e.id) AS encounter_count
    FROM patient_age_groups pag
    JOIN encounters e
        ON pag.patient_id = e.patient
    GROUP BY pag.age_group
),

medication_summary AS (
    SELECT
        pag.age_group,
        SUM(m.totalcost::numeric) AS medication_cost
    FROM patient_age_groups pag
    JOIN medications m
        ON pag.patient_id = m.patient
    GROUP BY pag.age_group
)

SELECT
    pc.age_group,
    ROUND(cs.claim_count::numeric / pc.patient_count, 2) AS claims_per_patient,
    ROUND(es.encounter_count::numeric / pc.patient_count, 2) AS encounters_per_patient,
    ROUND(ms.medication_cost, 2) AS medication_cost
FROM patient_counts pc
JOIN claims_summary cs
    ON pc.age_group = cs.age_group
JOIN encounter_summary es
    ON pc.age_group = es.age_group
JOIN medication_summary ms
    ON pc.age_group = ms.age_group
ORDER BY
    CASE pc.age_group
        WHEN 'Under 18' THEN 1
        WHEN '18-34' THEN 2
        WHEN '35-49' THEN 3
        WHEN '50-64' THEN 4
        WHEN '65+' THEN 5
    END;
    
