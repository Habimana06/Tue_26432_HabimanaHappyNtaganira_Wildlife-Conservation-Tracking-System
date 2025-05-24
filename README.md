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

Schema Diagram:

![Schema Diagram](https://github.com/Habimana06/Tue_26432_HabimanaHappyNtaganira_Wildlife-Conservation-Tracking-System/blob/main/Untitled%20Diagram.drawio%20(1).png?raw=true)

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

![Species Table](https://github.com/Habimana06/Tue_26432_HabimanaHappyNtaganira_Wildlife-Conservation-Tracking-System/blob/main/screenshot/Screenshot%202025-04-21%20171015.png?raw=true)

CREATE TABLE Habitat (
    Habitat_ID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    Location VARCHAR2(100),
    Area_Size NUMBER
);

![Habitata Table](https://github.com/Habimana06/Tue_26432_HabimanaHappyNtaganira_Wildlife-Conservation-Tracking-System/blob/main/screenshot/Screenshot%202025-04-21%20171038.png?raw=true)

CREATE TABLE Animal (
    Animal_ID NUMBER PRIMARY KEY,
    Name VARCHAR2(50),
    Gender VARCHAR2(10),
    Species_ID NUMBER REFERENCES Species(Species_ID),
    Habitat_ID NUMBER REFERENCES Habitat(Habitat_ID),
    Health_Status VARCHAR2(50),
    Birth_Date DATE
);

![Animal Table](https://github.com/Habimana06/Tue_26432_HabimanaHappyNtaganira_Wildlife-Conservation-Tracking-System/blob/main/screenshot/Screenshot%202025-04-21%20171119.png?raw=true)

CREATE TABLE Ranger (
    Ranger_ID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    Email VARCHAR2(100),
    Phone VARCHAR2(20),
    Area_Assigned VARCHAR2(100)
);

![Ranger Table](https://github.com/Habimana06/Tue_26432_HabimanaHappyNtaganira_Wildlife-Conservation-Tracking-System/blob/main/screenshot/Screenshot%202025-04-21%20171139.png?raw=true)

CREATE TABLE Incident (
    Incident_ID NUMBER PRIMARY KEY,
    Animal_ID NUMBER REFERENCES Animal(Animal_ID),
    Ranger_ID NUMBER REFERENCES Ranger(Ranger_ID),
    Incident_Type VARCHAR2(50),
    Date_Reported DATE,
    Description VARCHAR2(500)
);

![Incident Table](https://github.com/Habimana06/Tue_26432_HabimanaHappyNtaganira_Wildlife-Conservation-Tracking-System/blob/main/screenshot/Screenshot%202025-04-21%20171157.png?raw=true)

CREATE TABLE Medical_Treatment (
    Treatment_ID NUMBER PRIMARY KEY,
    Animal_ID NUMBER REFERENCES Animal(Animal_ID),
    Treatment_Type VARCHAR2(100),
    Treatment_Date DATE,
    Outcome VARCHAR2(100)
);

![Medical_Treatment Table](https://github.com/Habimana06/Tue_26432_HabimanaHappyNtaganira_Wildlife-Conservation-Tracking-System/blob/main/screenshot/Screenshot%202025-04-21%20171216.png?raw=true)

CREATE TABLE Researcher (
    Researcher_ID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    Organization VARCHAR2(100),
    Specialization VARCHAR2(100)
);

![Researcher Table](https://github.com/Habimana06/Tue_26432_HabimanaHappyNtaganira_Wildlife-Conservation-Tracking-System/blob/main/screenshot/Screenshot%202025-04-21%20171241.png?raw=true)

CREATE TABLE Audit_Log (
    Log_ID NUMBER PRIMARY KEY,
    User_Name VARCHAR2(50),
    Operation VARCHAR2(20),
    Table_Affected VARCHAR2(50),
    Action_Date DATE,
    Status VARCHAR2(10)
);

![Audit_Log Table](https://github.com/Habimana06/Tue_26432_HabimanaHappyNtaganira_Wildlife-Conservation-Tracking-System/blob/main/screenshot/Screenshot%202025-04-21%20171322.png?raw=true)

INSERT DATA INTO TABLE

-- Species
INSERT INTO Species VALUES (1, 'Mountain Gorilla', 'Mammal', 'Endangered');

![Species Insert ](https://github.com/Habimana06/Tue_26432_HabimanaHappyNtaganira_Wildlife-Conservation-Tracking-System/blob/main/screenshot/Screenshot%202025-04-21%20171915.png?raw=true)

-- Habitat
INSERT INTO Habitat VALUES (1, 'Volcanoes National Park', 'Northern Province', 1600);

![Habitat Insert](https://github.com/Habimana06/Tue_26432_HabimanaHappyNtaganira_Wildlife-Conservation-Tracking-System/blob/main/screenshot/Screenshot%202025-04-21%20171952.png?raw=true)

-- Animal
INSERT INTO Animal VALUES (1, 'Imbuto', 'Female', 1, 1, 'Healthy', TO_DATE('2013-08-12', 'YYYY-MM-DD'));

![ Animal Insert](https://github.com/Habimana06/Tue_26432_HabimanaHappyNtaganira_Wildlife-Conservation-Tracking-System/blob/main/screenshot/Screenshot%202025-04-21%20172025.png?raw=true)

-- Ranger
INSERT INTO Ranger VALUES (1, 'Eric Ndayisaba', 'eric.ndayisaba@wildlife.rw', '0788001122', 'Volcanoes National Park');

![Ranger Insert](https://github.com/Habimana06/Tue_26432_HabimanaHappyNtaganira_Wildlife-Conservation-Tracking-System/blob/main/screenshot/Screenshot%202025-04-21%20172044.png?raw=true)

-- Incident
INSERT INTO Incident VALUES (1, 2, 2, 'Snaring', TO_DATE('2025-04-10', 'YYYY-MM-DD'), 'Crane injured in trap near marsh area.');


![Incident Insert](https://github.com/Habimana06/Tue_26432_HabimanaHappyNtaganira_Wildlife-Conservation-Tracking-System/blob/main/screenshot/Screenshot%202025-04-21%20172104.png?raw=true)

-- Medical_Treatment
INSERT INTO Medical_Treatment VALUES (11, 2, 'Wing Treatment', TO_DATE('2025-04-11', 'YYYY-MM-DD'), 'Recovering');

![Medical_Treatment Insert](https://github.com/Habimana06/Tue_26432_HabimanaHappyNtaganira_Wildlife-Conservation-Tracking-System/blob/main/screenshot/Screenshot%202025-04-21%20172613.png?raw=true)

-- Researcher
INSERT INTO Researcher VALUES (11, 'Dr. Jeanette Umwali', 'Rwanda Wildlife Institute', 'Ornithology');

![Researcher Insert](https://github.com/Habimana06/Tue_26432_HabimanaHappyNtaganira_Wildlife-Conservation-Tracking-System/blob/main/screenshot/Screenshot%202025-04-21%20172426.png?raw=true)

-- Public_Holidays
INSERT INTO Public_Holidays VALUES (11, 'Kwibohora (Liberation Day)', TO_DATE('2025-07-04', 'YYYY-MM-DD'));

![Public_Holidays Insert](https://github.com/Habimana06/Tue_26432_HabimanaHappyNtaganira_Wildlife-Conservation-Tracking-System/blob/main/screenshot/Screenshot%202025-04-21%20172454.png?raw=true)

-- =============================
-- Package Specification & Body
-- =============================

CREATE OR REPLACE PACKAGE Animal_Incident_Pkg AS
  PROCEDURE GetAnimalIncidents(p_animal_id IN NUMBER);
  FUNCTION CountIncidents(p_animal_id IN NUMBER) RETURN NUMBER;
END Animal_Incident_Pkg;
/



CREATE OR REPLACE PACKAGE BODY Animal_Incident_Pkg AS

  PROCEDURE GetAnimalIncidents(p_animal_id IN NUMBER) IS
    CURSOR incident_cursor IS
      SELECT incident_id, incident_type, date_reported
      FROM Incident
      WHERE animal_id = p_animal_id
      ORDER BY date_reported DESC;

    rec incident_cursor%ROWTYPE;




    
  BEGIN
    DBMS_OUTPUT.PUT_LINE('--- Incidents for Animal ID: ' || p_animal_id || ' ---');
    OPEN incident_cursor;
    LOOP
      FETCH incident_cursor INTO rec;
      EXIT WHEN incident_cursor%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE('Incident ID: ' || rec.incident_id || 
                           ', Type: ' || rec.incident_type || 
                           ', Date: ' || TO_CHAR(rec.date_reported, 'YYYY-MM-DD'));
    END LOOP;
    CLOSE incident_cursor;
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
  END;

  



  FUNCTION CountIncidents(p_animal_id IN NUMBER)
  RETURN NUMBER IS
    incident_count NUMBER;
  BEGIN
    SELECT COUNT(*) INTO incident_count
    FROM Incident
    WHERE animal_id = p_animal_id;
    RETURN incident_count;
  EXCEPTION
    WHEN OTHERS THEN
      RETURN -1;
  END;

END Animal_Incident_Pkg;
/



-- =======================
-- Analytics (Window Func)
-- =======================

CREATE OR REPLACE VIEW Animal_Incident_Rank_View AS
SELECT 
  animal_id,
  incident_id,
  incident_type,
  date_reported,
  RANK() OVER (PARTITION BY animal_id ORDER BY date_reported DESC) AS incident_rank
FROM Incident;

![Animal_Incident_Rank_View](https://github.com/Habimana06/Tue_26432_HabimanaHappyNtaganira_Wildlife-Conservation-Tracking-System/blob/main/screenshot/Screenshot%202025-04-21%20185528.png?raw=true)

![Animal_Incident_Rank_View](https://github.com/Habimana06/Tue_26432_HabimanaHappyNtaganira_Wildlife-Conservation-Tracking-System/blob/main/screenshot/Screenshot%202025-04-21%20185627.png?raw=true)

-- ====================
-- Testing the Package
-- ====================

BEGIN
  -- Test: Fetch incidents for Animal ID 2
  Animal_Incident_Pkg.GetAnimalIncidents(2);
  
  -- Test: Count incidents for Animal ID 2
  DBMS_OUTPUT.PUT_LINE('Total incidents for animal 2: ' || Animal_Incident_Pkg.CountIncidents(2));
END;
/

![ Testing the Package](https://github.com/Habimana06/Tue_26432_HabimanaHappyNtaganira_Wildlife-Conservation-Tracking-System/blob/main/screenshot/Screenshot%202025-04-21%20173753.png?raw=true)


-- ===================
-- Optional: Query View
-- ===================

-- Get most recent incident per animal
SELECT * FROM Animal_Incident_Rank_View
WHERE incident_rank = 1;

-- =================
-- Sample Data
-- =================

![DATA IN TABLE](https://github.com/Habimana06/Tue_26432_HabimanaHappyNtaganira_Wildlife-Conservation-Tracking-System/blob/main/screenshot/Screenshot%202025-04-21%20184040.png?raw=true)

![DATA IN TABLE](https://github.com/Habimana06/Tue_26432_HabimanaHappyNtaganira_Wildlife-Conservation-Tracking-System/blob/main/screenshot/Screenshot%202025-04-21%20184100.png?raw=true)




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





## 🚀 How to Run the SQL Script

Follow these steps to set up and run the Wildlife Conservation Tracking System SQL scripts:

### 📦 Requirements
- Oracle Database installed (any edition)
- Oracle SQL*Plus **or** SQL Developer
- Proper user privileges to create tables and run PL/SQL blocks

---

### 📝 Steps to Execute the Script

1. **Open SQL Developer or SQL*Plus**  
   - Launch Oracle SQL Developer or connect via SQL*Plus.

2. **Connect to your Database**  
   - Example:  
     ```sql
     CONNECT username/password@localhost:1521/xe
     ```

3. **Open the SQL script file**  
   - In SQL Developer:  
     - Go to `File > Open` and browse to `Wildlife Conservation Tracking System-Script.sql`
     - Or drag and drop the file into SQL Developer editor

4. **Enable DBMS_OUTPUT (for testing outputs)**  
   - In SQL Developer:  
     - Go to `View > DBMS Output`
     - Click `+` sign, select your connection to enable output

     Or run in SQL*Plus:
     ```sql
     SET SERVEROUTPUT ON;
     ```

5. **Run the Script**
   - Click the **Run Script** button in SQL Developer  
   - Or type `@Wildlife Conservation Tracking System-Script` in SQL*Plus:
     ```sql
     @C:\path\to\Wildlife Conservation Tracking System-Script.sql
     ```

6. **Verify Output and Tables**
   - Run queries like:
     ```sql
     SELECT * FROM Species;
     ```

---

### 🔧 Maintenance
- Rerun the script anytime to recreate tables
- Make sure DBMS_OUTPUT is enabled to see PL/SQL outputs or debug info

