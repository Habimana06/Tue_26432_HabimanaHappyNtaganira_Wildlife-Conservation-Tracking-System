
-- Wildlife Conservation Tracking System - Table Creation Script

CREATE TABLE Species (
    Species_ID NUMBER PRIMARY KEY,
    Species_Name VARCHAR2(100),
    Category VARCHAR2(50),
    Conservation_Status VARCHAR2(50)
);

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
