-- 01_CREATE_TABLES

DROP TABLE IF EXISTS claims;

CREATE TABLE claims (
    id TEXT,
    patientid TEXT,
    providerid TEXT,
    primarypatientinsuranceid TEXT,
    secondarypatientinsuranceid TEXT,
    departmentid TEXT,
    patientdepartmentid TEXT,
    diagnosis1 TEXT,
    diagnosis2 TEXT,
    diagnosis3 TEXT,
    diagnosis4 TEXT,
    diagnosis5 TEXT,
    diagnosis6 TEXT,
    diagnosis7 TEXT,
    diagnosis8 TEXT,
    referringproviderid TEXT,
    appointmentid TEXT,
    currentillnessdate TEXT,
    servicedate TEXT,
    supervisingproviderid TEXT,
    status1 TEXT,
    status2 TEXT,
    statusp TEXT,
    outstanding1 TEXT,
    outstanding2 TEXT,
    outstandingp TEXT,
    lastbilleddate1 TEXT,
    lastbilleddate2 TEXT,
    lastbilleddatep TEXT,
    healthcareclaimtypeid1 TEXT,
    healthcareclaimtypeid2 TEXT
);

DROP TABLE IF EXISTS patients;

CREATE TABLE patients (
    id TEXT,
    birthdate TEXT,
    deathdate TEXT,
    ssn TEXT,
    drivers TEXT,
    passport TEXT,
    prefix TEXT,
    first TEXT,
    middle TEXT,
    last TEXT,
    suffix TEXT,
    maiden TEXT,
    marital TEXT,
    race TEXT,
    ethnicity TEXT,
    gender TEXT,
    birthplace TEXT,
    address TEXT,
    city TEXT,
    state TEXT,
    county TEXT,
    fips TEXT,
    zip TEXT,
    lat TEXT,
    lon TEXT,
    healthcare_expenses TEXT,
    healthcare_coverage TEXT,
    income TEXT
);

-- Encounters table
-- Source: encounters.csv
-- One row per healthcare encounter

DROP TABLE IF EXISTS encounters;

CREATE TABLE encounters (
    id TEXT,
    start TEXT,
    stop TEXT,
    patient TEXT,
    organization TEXT,
    provider TEXT,
    payer TEXT,
    encounterclass TEXT,
    code TEXT,
    description TEXT,
    base_encounter_cost TEXT,
    total_claim_cost TEXT,
    payer_coverage TEXT,
    reasoncode TEXT,
    reasondescription TEXT
);

DROP TABLE IF EXISTS payers;

CREATE TABLE payers (
    id TEXT,
    name TEXT,
    ownership TEXT,
    address TEXT,
    city TEXT,
    state_headquarters TEXT,
    zip TEXT,
    phone TEXT,
    amount_covered TEXT,
    amount_uncovered TEXT,
    revenue TEXT,
    covered_encounters TEXT,
    uncovered_encounters TEXT,
    covered_medications TEXT,
    uncovered_medications TEXT,
    covered_procedures TEXT,
    uncovered_procedures TEXT,
    covered_immunizations TEXT,
    uncovered_immunizations TEXT,
    unique_customers TEXT,
    QOLS_AVG TEXT,
    member_months TEXT
);

DROP TABLE IF EXISTS conditions;

CREATE TABLE conditions (
    start TEXT,
    stop TEXT,
    patient TEXT,
    encounter TEXT,
    system TEXT,
    code TEXT,
    description TEXT
);

DROP TABLE IF EXISTS medications;

CREATE TABLE medications (
    start TEXT,
    stop TEXT,
    patient TEXT,
    payer TEXT,
    encounter TEXT,
    code TEXT,
    description TEXT,
    base_cost TEXT,
    payer_coverage TEXT,
    dispenses TEXT,
    totalcost TEXT,
    reasoncode TEXT,
    reasondescription TEXT
);