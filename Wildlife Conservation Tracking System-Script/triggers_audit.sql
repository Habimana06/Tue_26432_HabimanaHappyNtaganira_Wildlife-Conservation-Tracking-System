-- Wildlife Conservation Tracking System - Table Creation Script

-- Table creation
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

-- Trigger for Restricting Weekdays and Public Holidays (for Species table)
CREATE OR REPLACE TRIGGER restrict_weekday_and_holiday
BEFORE INSERT OR UPDATE OR DELETE ON Species
FOR EACH ROW
DECLARE
    v_day_of_week VARCHAR2(9);
    v_is_public_holiday VARCHAR2(1);
BEGIN
    -- Check the current day of the week (1 = Sunday, 7 = Saturday)
    SELECT TO_CHAR(SYSDATE, 'Day') INTO v_day_of_week FROM dual;
    
    -- Restrict operations on weekdays (Monday to Friday)
    IF v_day_of_week IN ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday') THEN
        RAISE_APPLICATION_ERROR(-20001, 'Operation not allowed during weekdays');
    END IF;
    
    -- Check if today is a public holiday
    SELECT COUNT(*) INTO v_is_public_holiday
    FROM Public_Holidays
    WHERE Holiday_Date = TRUNC(SYSDATE);
    
    IF v_is_public_holiday > 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Operation not allowed on public holidays');
    END IF;
END restrict_weekday_and_holiday;
/

-- Compound Trigger for Multiple Row Handling (for Animal table)
CREATE OR REPLACE TRIGGER restrict_multiple_operations
FOR INSERT OR UPDATE OR DELETE ON Animal
COMPOUND TRIGGER
    -- Declare local variables
    v_day_of_week VARCHAR2(9);
    v_is_public_holiday VARCHAR2(1);
  
    BEFORE STATEMENT IS
    BEGIN
        -- Check the current day of the week (1 = Sunday, 7 = Saturday)
        SELECT TO_CHAR(SYSDATE, 'Day') INTO v_day_of_week FROM dual;
        
        -- Restrict operations on weekdays (Monday to Friday)
        IF v_day_of_week IN ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday') THEN
            RAISE_APPLICATION_ERROR(-20001, 'Operation not allowed during weekdays');
        END IF;
        
        -- Check if today is a public holiday
        SELECT COUNT(*) INTO v_is_public_holiday
        FROM Public_Holidays
        WHERE Holiday_Date = TRUNC(SYSDATE);
        
        IF v_is_public_holiday > 0 THEN
            RAISE_APPLICATION_ERROR(-20002, 'Operation not allowed on public holidays');
        END IF;
    END BEFORE STATEMENT;
  
    AFTER STATEMENT IS
    BEGIN
        NULL; -- No additional actions after the statement
    END AFTER STATEMENT;
END restrict_multiple_operations;
/

-- Audit Log Trigger for Species Table
CREATE OR REPLACE TRIGGER audit_log_trigger
AFTER INSERT OR UPDATE OR DELETE ON Species
FOR EACH ROW
DECLARE
    v_status VARCHAR2(10);
BEGIN
    -- Determine if the action was allowed or denied
    IF (ORA_ERROR_NUMBER != 0) THEN
        v_status := 'Denied';
    ELSE
        v_status := 'Allowed';
    END IF;

    -- Insert into the audit log table
    INSERT INTO Audit_Log (User_Name, Operation, Table_Affected, Action_Date, Status)
    VALUES (USER, 'INSERT/UPDATE/DELETE', 'Species', SYSDATE, v_status);
END audit_log_trigger;
/

-- Function to Automate Auditing
CREATE OR REPLACE FUNCTION log_audit (
    p_user_name VARCHAR2,
    p_operation VARCHAR2,
    p_table_affected VARCHAR2,
    p_status VARCHAR2
) RETURN VARCHAR2 IS
BEGIN
    -- Insert a record into the audit log table
    INSERT INTO Audit_Log (User_Name, Operation, Table_Affected, Action_Date, Status)
    VALUES (p_user_name, p_operation, p_table_affected, SYSDATE, p_status);
    
    RETURN 'Audit Log Entry Created';
END log_audit;
/

-- Example of Calling log_audit in a Trigger (for any other table like Ranger)
CREATE OR REPLACE TRIGGER audit_log_ranger
AFTER INSERT OR UPDATE OR DELETE ON Ranger
FOR EACH ROW
DECLARE
    v_status VARCHAR2(10);
BEGIN
    -- Determine if the action was allowed or denied
    IF (ORA_ERROR_NUMBER != 0) THEN
        v_status := 'Denied';
    ELSE
        v_status := 'Allowed';
    END IF;

    -- Log audit entry using the log_audit function
    log_audit(USER, 'INSERT/UPDATE/DELETE', 'Ranger', v_status);
END audit_log_ranger;
/
