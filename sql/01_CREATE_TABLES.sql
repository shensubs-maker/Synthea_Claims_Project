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