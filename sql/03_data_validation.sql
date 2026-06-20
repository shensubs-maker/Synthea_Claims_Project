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