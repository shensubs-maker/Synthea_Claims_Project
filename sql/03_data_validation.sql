-- Validate claims table row count

SELECT COUNT(*)
FROM claims;

-- Validate patients table row count

SELECT COUNT(*)
FROM patients;

-- Check for duplicate patient IDs

SELECT
    id,
    COUNT(*)
FROM patients
GROUP BY id
HAVING COUNT(*) > 1;

-- Check for duplicate claim IDs

SELECT
    id,
    COUNT(*)
FROM claims
GROUP BY id
HAVING COUNT(*) > 1;

-- Check for missing birthdates

SELECT COUNT(*)
FROM patients
WHERE birthdate IS NULL;

--  Check for missing gender values

SELECT COUNT(*)
FROM patients
WHERE gender IS NULL;

-- Review gender values

SELECT DISTINCT gender
FROM patients;

-- Check for claims without a matching patient record

SELECT COUNT(*)
FROM claims c
LEFT JOIN patients p
    ON c.patientid = p.id 
WHERE p.id IS NULL;

-- Validate that all encounters are linked to patients

SELECT COUNT(*)
FROM encounters e
LEFT JOIN patients p
    ON e.patient = p.id
WHERE p.id IS NULL;

-- Count encounters by age group

SELECT  
    CASE
        WHEN EXTRACT(YEAR FROM AGE(CURRENT_DATE, birthdate::date)) < 18 THEN 'Under 18'
        WHEN EXTRACT(YEAR FROM AGE(CURRENT_DATE, birthdate::date)) BETWEEN 18 AND 34 THEN '18-34'
        WHEN EXTRACT(YEAR FROM AGE(CURRENT_DATE, birthdate::date)) BETWEEN 35 AND 49 THEN '35-49'
        WHEN EXTRACT(YEAR FROM AGE(CURRENT_DATE, birthdate::date)) BETWEEN 50 AND 64 THEN '50-64'
        ELSE '65+'
    END AS age_group,
 COUNT(e.id) AS encounter_count
FROM encounters e
JOIN patients p
    ON e.patient = p.id
GROUP BY age_group
ORDER BY encounter_count DESC;

-- Validation that all encounters are linked to a payer

SELECT COUNT(*)
FROM encounters e
JOIN payers p
    ON e.payer = p.id 
WHERE p.id IS NULL;

