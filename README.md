# Tue_26432_HabimanaHappyNtaganira_Wildlife-Conservation-Tracking-System


A comprehensive Oracle SQL database for managing wildlife conservation efforts in Rwanda.

Features:
- Species & habitat management
- Animal health monitoring
- Ranger operations tracking
- Medical treatment records
- Public holiday restrictions
- Audit logging & security
- Incident analytics

Schema Diagram: See 'schema-diagram.png' in repository
*/
-- =======================
-- Table Creation Script
-- =======================

CREATE TABLE Species (
    Species_ID NUMBER PRIMARY KEY,
    Species_Name VARCHAR2(100),
    Category VARCHAR2(50),
    Conservation_Status VARCHAR2(50)
);

[screenshot]Screenshot%202025-04-21%20171015.png

CREATE TABLE Habitat (
    Habitat_ID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    Location VARCHAR2(100),
    Area_Size NUMBER
);

CREATE TABLE Animal (
    Animal_ID NUMBER PRIMARY KEY,
    Name VARCHAR2(50),
    Gender VARCHAR2(10),
    Species_ID NUMBER REFERENCES Species(Species_ID),
    Habitat_ID NUMBER REFERENCES Habitat(Habitat_ID),
    Health_Status VARCHAR2(50),
    Birth_Date DATE
);

CREATE TABLE Ranger (
    Ranger_ID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    Email VARCHAR2(100),
    Phone VARCHAR2(20),
    Area_Assigned VARCHAR2(100)
);

CREATE TABLE Incident (
    Incident_ID NUMBER PRIMARY KEY,
    Animal_ID NUMBER REFERENCES Animal(Animal_ID),
    Ranger_ID NUMBER REFERENCES Ranger(Ranger_ID),
    Incident_Type VARCHAR2(50),
    Date_Reported DATE,
    Description VARCHAR2(500)
);

CREATE TABLE Medical_Treatment (
    Treatment_ID NUMBER PRIMARY KEY,
    Animal_ID NUMBER REFERENCES Animal(Animal_ID),
    Treatment_Type VARCHAR2(100),
    Treatment_Date DATE,
    Outcome VARCHAR2(100)
);

CREATE TABLE Researcher (
    Researcher_ID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    Organization VARCHAR2(100),
    Specialization VARCHAR2(100)
);

CREATE TABLE Public_Holidays (
    Holiday_ID NUMBER PRIMARY KEY,
    Holiday_Name VARCHAR2(100),
    Holiday_Date DATE
);

CREATE TABLE Audit_Log (
    Log_ID NUMBER PRIMARY KEY,
    User_Name VARCHAR2(50),
    Operation VARCHAR2(20),
    Table_Affected VARCHAR2(50),
    Action_Date DATE,
    Status VARCHAR2(10)
);

-- =================
-- Sample Data
-- =================

-- Species
INSERT INTO Species VALUES (1, 'Mountain Gorilla', 'Mammal', 'Endangered');
/* (All 10 species records here) */

-- Habitat
INSERT INTO Habitat VALUES (1, 'Volcanoes National Park', 'Northern Province', 1600);
/* (All 10 habitat records here) */

-- Animal
INSERT INTO Animal VALUES (1, 'Imbuto', 'Female', 1, 1, 'Healthy', TO_DATE('2013-08-12', 'YYYY-MM-DD'));
/* (All 10 animal records here) */

-- Ranger
INSERT INTO Ranger VALUES (1, 'Eric Ndayisaba', 'eric.ndayisaba@wildlife.rw', '0788001122', 'Volcanoes National Park');
/* (All 10 ranger records here) */

-- Incident
INSERT INTO Incident VALUES (1, 2, 2, 'Snaring', TO_DATE('2025-04-10', 'YYYY-MM-DD'), 'Crane injured in trap near marsh area.');
/* (All 10 incident records here) */

-- Medical_Treatment
INSERT INTO Medical_Treatment VALUES (11, 2, 'Wing Treatment', TO_DATE('2025-04-11', 'YYYY-MM-DD'), 'Recovering');
/* (All 10 treatment records here) */

-- Researcher
INSERT INTO Researcher VALUES (11, 'Dr. Jeanette Umwali', 'Rwanda Wildlife Institute', 'Ornithology');
/* (All 10 researcher records here) */

-- Public_Holidays
INSERT INTO Public_Holidays VALUES (11, 'Kwibohora (Liberation Day)', TO_DATE('2025-07-04', 'YYYY-MM-DD'));
/* (All 10 holiday records here) */

-- ====================
-- Triggers & Functions
-- ====================

-- Restrict Species modifications on weekdays/holidays
CREATE OR REPLACE TRIGGER restrict_weekday_and_holiday
BEFORE INSERT OR UPDATE OR DELETE ON Species /* Implementation */;

-- Animal table compound trigger
CREATE OR REPLACE TRIGGER restrict_multiple_operations
FOR INSERT OR UPDATE OR DELETE ON Animal /* Implementation */;

-- Audit logging function
CREATE OR REPLACE FUNCTION log_audit /* Implementation */;

-- Species audit trigger
CREATE OR REPLACE TRIGGER audit_log_trigger
AFTER INSERT OR UPDATE OR DELETE ON Species /* Implementation */;

-- Ranger audit trigger
CREATE OR REPLACE TRIGGER audit_log_ranger
AFTER INSERT OR UPDATE OR DELETE ON Ranger /* Implementation */;

-- ==============
-- Analytics
-- ==============

-- Incident tracking package
CREATE OR REPLACE PACKAGE Animal_Incident_Pkg AS
  PROCEDURE GetAnimalIncidents(p_animal_id IN NUMBER);
  FUNCTION CountIncidents(p_animal_id IN NUMBER) RETURN NUMBER;
END Animal_Incident_Pkg;
/

CREATE OR REPLACE PACKAGE BODY Animal_Incident_Pkg AS /* Implementation */;

-- Incident ranking view
CREATE OR REPLACE VIEW Animal_Incident_Rank_View AS
SELECT /* Window function implementation */;

-- ===========
-- Testing
-- ===========

BEGIN
  Animal_Incident_Pkg.GetAnimalIncidents(2);
  DBMS_OUTPUT.PUT_LINE('Incidents: ' || Animal_Incident_Pkg.CountIncidents(2));
END;
/

-- ============
-- Documentation
-- ============

/*
Usage Examples:
1. Get animal incidents:
BEGIN
  Animal_Incident_Pkg.GetAnimalIncidents(2);
END;

2. Check recent incidents:
SELECT * FROM Animal_Incident_Rank_View 
WHERE incident_rank = 1;

Maintenance:
- Run script in Oracle SQL*Plus/SQL Developer
- Replace schema-diagram.png with actual ER diagram
- Enable DBMS_OUTPUT for testing output
*/
