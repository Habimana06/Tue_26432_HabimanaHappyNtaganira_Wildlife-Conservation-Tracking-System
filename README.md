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
![Schema Diagram]((https://github.com/Habimana06/Tue_26432_HabimanaHappyNtaganira_Wildlife-Conservation-Tracking-System/blob/main/Untitled%20Diagram.drawio%20(1).png)?raw=true)

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

![Medical_Treatment Table](https://github.com/Habimana06/Tue_26432_HabimanaHappyNtaganira_Wildlife-Conservation-Tracking-System/blob/main/screenshot/Screenshot%202025-04-21%171216.png?raw=true)

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
INSERT INTO Species VALUES (2, 'Grey Crowned Crane', 'Bird', 'Vulnerable');
INSERT INTO Species VALUES (3, 'African Buffalo', 'Mammal', 'Least Concern');
INSERT INTO Species VALUES (4, 'Serval', 'Mammal', 'Least Concern');
INSERT INTO Species VALUES (5, 'White Rhinoceros', 'Mammal', 'Near Threatened');
INSERT INTO Species VALUES (6, 'Papyrus Gonolek', 'Bird', 'Near Threatened');
INSERT INTO Species VALUES (7, 'Leopard', 'Mammal', 'Vulnerable');
INSERT INTO Species VALUES (8, 'African Fish Eagle', 'Bird', 'Least Concern');
INSERT INTO Species VALUES (9, 'Golden Monkey', 'Mammal', 'Endangered');
INSERT INTO Species VALUES (10, 'African Elephant', 'Mammal', 'Endangered');

![Species Insert ](https://github.com/Habimana06/Tue_26432_HabimanaHappyNtaganira_Wildlife-Conservation-Tracking-System/blob/main/screenshot/Screenshot%202025-04-21%20171915.png?raw=true)

-- Habitat
INSERT INTO Habitat VALUES (1, 'Volcanoes National Park', 'Northern Province', 1600);
INSERT INTO Habitat VALUES (2, 'Akagera National Park', 'Eastern Province', 2500);
INSERT INTO Habitat VALUES (3, 'Nyungwe Forest', 'Western Province', 2100);
INSERT INTO Habitat VALUES (4, 'Gishwati-Mukura Park', 'North-Western Province', 900);
INSERT INTO Habitat VALUES (5, 'Rugezi Marsh', 'Northern Province', 600);
INSERT INTO Habitat VALUES (6, 'Bugesera Wetlands', 'Eastern Province', 700);
INSERT INTO Habitat VALUES (7, 'Lake Kivu Shoreline', 'Western Province', 1800);
INSERT INTO Habitat VALUES (8, 'Bugarama Valley', 'Southern Province', 1200);
INSERT INTO Habitat VALUES (9, 'Kibira Forest Extension', 'South-West Border', 1900);
INSERT INTO Habitat VALUES (10, 'Kigali Outskirts Reserve', 'Central Province', 1300);

![Habitat Insert](https://github.com/Habimana06/Tue_26432_HabimanaHappyNtaganira_Wildlife-Conservation-Tracking-System/blob/main/screenshot/Screenshot%202025-04-21%20171952.png?raw=true)

-- Animal
INSERT INTO Animal VALUES (1, 'Imbuto', 'Female', 1, 1, 'Healthy', TO_DATE('2013-08-12', 'YYYY-MM-DD'));
INSERT INTO Animal VALUES (2, 'Karabo', 'Male', 2, 2, 'Injured', TO_DATE('2018-02-25', 'YYYY-MM-DD'));
INSERT INTO Animal VALUES (3, 'Inkuba', 'Male', 3, 2, 'Healthy', TO_DATE('2015-11-06', 'YYYY-MM-DD'));
INSERT INTO Animal VALUES (4, 'Tamu', 'Female', 4, 3, 'Sick', TO_DATE('2014-05-20', 'YYYY-MM-DD'));
INSERT INTO Animal VALUES (5, 'Rukuru', 'Male', 5, 4, 'Critical', TO_DATE('2011-09-13', 'YYYY-MM-DD'));
INSERT INTO Animal VALUES (6, 'Zuba', 'Female', 6, 5, 'Healthy', TO_DATE('2017-06-15', 'YYYY-MM-DD'));
INSERT INTO Animal VALUES (7, 'Bahari', 'Male', 7, 6, 'Injured', TO_DATE('2016-03-09', 'YYYY-MM-DD'));
INSERT INTO Animal VALUES (8, 'Akira', 'Female', 8, 7, 'Healthy', TO_DATE('2012-12-29', 'YYYY-MM-DD'));
INSERT INTO Animal VALUES (9, 'Gakuru', 'Male', 9, 8, 'Sick', TO_DATE('2010-07-07', 'YYYY-MM-DD'));
INSERT INTO Animal VALUES (10, 'Shujaa', 'Male', 10, 9, 'Healthy', TO_DATE('2009-04-18', 'YYYY-MM-DD'));

![ Animal Insert](https://github.com/Habimana06/Tue_26432_HabimanaHappyNtaganira_Wildlife-Conservation-Tracking-System/blob/main/screenshot/Screenshot%202025-04-21%20172025.png?raw=true)

-- Ranger
INSERT INTO Ranger VALUES (1, 'Eric Ndayisaba', 'eric.ndayisaba@wildlife.rw', '0788001122', 'Volcanoes National Park');
INSERT INTO Ranger VALUES (2, 'Aline Uwimana', 'aline.uwimana@wildlife.rw', '0788002233', 'Akagera National Park');
INSERT INTO Ranger VALUES (3, 'Samuel Hakizimana', 'samuel.h@wildlife.rw', '0788003344', 'Nyungwe Forest');
INSERT INTO Ranger VALUES (4, 'Claudine Mukamana', 'claudine.m@wildlife.rw', '0788004455', 'Gishwati-Mukura Park');
INSERT INTO Ranger VALUES (5, 'Patrick Habimana', 'patrick.h@wildlife.rw', '0788005566', 'Rugezi Marsh');
INSERT INTO Ranger VALUES (6, 'Josiane Uwase', 'josiane.u@wildlife.rw', '0788006677', 'Bugesera Wetlands');
INSERT INTO Ranger VALUES (7, 'Jean Bosco', 'jean.b@wildlife.rw', '0788007788', 'Lake Kivu Shoreline');
INSERT INTO Ranger VALUES (8, 'Mutesi Angelique', 'mutesi.a@wildlife.rw', '0788008899', 'Bugarama Valley');
INSERT INTO Ranger VALUES (9, 'Felicien Gatera', 'felicien.g@wildlife.rw', '0788009900', 'Kibira Forest Extension');
INSERT INTO Ranger VALUES (10, 'Christine Nyirahabimana', 'christine.n@wildlife.rw', '0788010011', 'Kigali Outskirts Reserve');

![Ranger Insert](https://github.com/Habimana06/Tue_26432_HabimanaHappyNtaganira_Wildlife-Conservation-Tracking-System/blob/main/screenshot/Screenshot%202025-04-21%20172044.png?raw=true)

-- Incident
INSERT INTO Incident VALUES (1, 2, 2, 'Snaring', TO_DATE('2025-04-10', 'YYYY-MM-DD'), 'Crane injured in trap near marsh area.');
INSERT INTO Incident VALUES (2, 5, 4, 'Poaching', TO_DATE('2025-03-03', 'YYYY-MM-DD'), 'White Rhino wounded by suspected poachers.');
INSERT INTO Incident VALUES (3, 4, 3, 'Illness', TO_DATE('2025-02-12', 'YYYY-MM-DD'), 'Serval displaying signs of respiratory infection.');
INSERT INTO Incident VALUES (4, 7, 6, 'Injury', TO_DATE('2025-01-29', 'YYYY-MM-DD'), 'Leopard injured while hunting.');
INSERT INTO Incident VALUES (5, 9, 8, 'Disease Outbreak', TO_DATE('2025-04-01', 'YYYY-MM-DD'), 'Golden Monkeys showing flu-like symptoms.');
INSERT INTO Incident VALUES (6, 6, 5, 'Trap Injury', TO_DATE('2025-03-15', 'YYYY-MM-DD'), 'Gonolek found with leg trapped.');
INSERT INTO Incident VALUES (7, 8, 7, 'Water Contamination', TO_DATE('2025-02-05', 'YYYY-MM-DD'), 'Fish Eagle affected by lake pollution.');
INSERT INTO Incident VALUES (8, 10, 9, 'Human Conflict', TO_DATE('2025-04-18', 'YYYY-MM-DD'), 'Elephant damaged farm property and got injured.');
INSERT INTO Incident VALUES (9, 3, 1, 'Fight Injury', TO_DATE('2025-03-25', 'YYYY-MM-DD'), 'Buffalo wounded in territorial clash.');
INSERT INTO Incident VALUES (10, 1, 1, 'Health Check', TO_DATE('2025-04-20', 'YYYY-MM-DD'), 'Routine check showed mild dehydration.');

![Incident Insert](https://github.com/Habimana06/Tue_26432_HabimanaHappyNtaganira_Wildlife-Conservation-Tracking-System/blob/main/screenshot/Screenshot%202025-04-21%20172104.png?raw=true)

-- Medical_Treatment
INSERT INTO Medical_Treatment VALUES (11, 2, 'Wing Treatment', TO_DATE('2025-04-11', 'YYYY-MM-DD'), 'Recovering');
INSERT INTO Medical_Treatment VALUES (12, 5, 'Bullet Wound Care', TO_DATE('2025-03-04', 'YYYY-MM-DD'), 'Stable condition');
INSERT INTO Medical_Treatment VALUES (13, 4, 'Antibiotics', TO_DATE('2025-02-13', 'YYYY-MM-DD'), 'Improving');
INSERT INTO Medical_Treatment VALUES (14, 7, 'Wound Stitching', TO_DATE('2025-01-30', 'YYYY-MM-DD'), 'Recovering');
INSERT INTO Medical_Treatment VALUES (15, 9, 'Quarantine & Flu Treatment', TO_DATE('2025-04-02', 'YYYY-MM-DD'), 'Ongoing observation');
INSERT INTO Medical_Treatment VALUES (16, 6, 'Leg Care & Monitoring', TO_DATE('2025-03-16', 'YYYY-MM-DD'), 'Responding well');
INSERT INTO Medical_Treatment VALUES (17, 8, 'Detox Therapy', TO_DATE('2025-02-06', 'YYYY-MM-DD'), 'Stable');
INSERT INTO Medical_Treatment VALUES (18, 10, 'Leg Wrap & Pain Relief', TO_DATE('2025-04-19', 'YYYY-MM-DD'), 'Improving');
INSERT INTO Medical_Treatment VALUES (19, 3, 'Antiseptic Application', TO_DATE('2025-03-26', 'YYYY-MM-DD'), 'Healed');
INSERT INTO Medical_Treatment VALUES (20, 1, 'Fluid Rehydration', TO_DATE('2025-04-21', 'YYYY-MM-DD'), 'Recovered');

![Medical_Treatment Insert](https://github.com/Habimana06/Tue_26432_HabimanaHappyNtaganira_Wildlife-Conservation-Tracking-System/blob/main/screenshot/Screenshot%202025-04-21%20172613.png?raw=true)

-- Researcher
INSERT INTO Researcher VALUES (11, 'Dr. Jeanette Umwali', 'Rwanda Wildlife Institute', 'Ornithology');
INSERT INTO Researcher VALUES (12, 'Prof. Patrick Mugisha', 'Kigali University of Conservation', 'Large Mammals');
INSERT INTO Researcher VALUES (13, 'Dr. Emmanuel Nsengimana', 'Akagera Wildlife Lab', 'Wetland Ecology');
INSERT INTO Researcher VALUES (14, 'Dr. Grace Ingabire', 'Gorilla Trust Rwanda', 'Primatology');
INSERT INTO Researcher VALUES (15, 'John Rukundo', 'Conservation NGO', 'Forest Biodiversity');
INSERT INTO Researcher VALUES (16, 'Martha Uwamahoro', 'Nyungwe Research Center', 'Medicinal Plants & Wildlife');
INSERT INTO Researcher VALUES (17, 'Alain Mutabazi', 'Lake Kivu Research Org', 'Avian Ecology');
INSERT INTO Researcher VALUES (18, 'Dr. Ange Tuyisenge', 'Rwanda Eco Alliance', 'Animal Nutrition');
INSERT INTO Researcher VALUES (19, 'Solange Kamikazi', 'Youth for Nature Rwanda', 'Community Conservation');
INSERT INTO Researcher VALUES (20, 'Eric Gasana', 'Global Wildlife Watch', 'Elephant Behavior');

![Researcher Insert](https://github.com/Habimana06/Tue_26432_HabimanaHappyNtaganira_Wildlife-Conservation-Tracking-System/blob/main/screenshot/Screenshot%202025-04-21%20172426.png?raw=true)

-- Public_Holidays
INSERT INTO Public_Holidays VALUES (11, 'Kwibohora (Liberation Day)', TO_DATE('2025-07-04', 'YYYY-MM-DD'));
INSERT INTO Public_Holidays VALUES (12, 'Umuganura (Harvest Day)', TO_DATE('2025-08-02', 'YYYY-MM-DD'));
INSERT INTO Public_Holidays VALUES (13, 'Genocide Memorial Day', TO_DATE('2025-04-07', 'YYYY-MM-DD'));
INSERT INTO Public_Holidays VALUES (14, 'Labour Day', TO_DATE('2025-05-01', 'YYYY-MM-DD'));
INSERT INTO Public_Holidays VALUES (15, 'Christmas Day', TO_DATE('2025-12-25', 'YYYY-MM-DD'));
INSERT INTO Public_Holidays VALUES (16, 'New Year''s Day', TO_DATE('2025-01-01', 'YYYY-MM-DD'));
INSERT INTO Public_Holidays VALUES (17, 'Heroes Day', TO_DATE('2025-02-01', 'YYYY-MM-DD'));
INSERT INTO Public_Holidays VALUES (18, 'Independence Day', TO_DATE('2025-07-01', 'YYYY-MM-DD'));
INSERT INTO Public_Holidays VALUES (19, 'Eid al-Fitr', TO_DATE('2025-03-31', 'YYYY-MM-DD'));
INSERT INTO Public_Holidays VALUES (20, 'Eid al-Adha', TO_DATE('2025-06-06', 'YYYY-MM-DD'));

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

![Animal_Incident_Rank_View](https://github.com/Habimana06/Tue_26432_HabimanaHappyNtaganira_Wildlife-Conservation-Tracking-System/blob/main/screenshot/Screenshot%202025-04-21%20175528.png?raw=true)

![Animal_Incident_Rank_View](https://github.com/Habimana06/Tue_26432_HabimanaHappyNtaganira_Wildlife-Conservation-Tracking-System/blob/main/screenshot/Screenshot%202025-04-21%20175627.png?raw=true)

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

![ Testing the Package](https://github.com/Habimana06/Tue_26432_HabimanaHappyNtaganira_Wildlife-Conservation-Tracking-System/blob/main/screenshot/Screenshot%202025-04-21%20175459.png?raw=true)

-- ===================
-- Optional: Query View
-- ===================

-- Get most recent incident per animal
SELECT * FROM Animal_Incident_Rank_View
WHERE incident_rank = 1;

-- =================
-- Sample Data
-- =================

![[DATA IN TABLE](https://github.com/Habimana06/Tue_26432_HabimanaHappyNtaganira_Wildlife-Conservation-Tracking-System/blob/main/screenshot/Screenshot%202025-04-21%20174040.png?raw=true)

![[DATA IN TABLE](https://github.com/Habimana06/Tue_26432_HabimanaHappyNtaganira_Wildlife-Conservation-Tracking-System/blob/main/screenshot/Screenshot%202025-04-21%20174100.png?raw=true)

![[DATA IN TABLE](https://github.com/Habimana06/Tue_26432_HabimanaHappyNtaganira_Wildlife-Conservation-Tracking-System/blob/main/screenshot/Screenshot%202025-04-21%20174116.png?raw=true)

![[DATA IN TABLE](https://github.com/Habimana06/Tue_26432_HabimanaHappyNtaganira_Wildlife-Conservation-Tracking-System/blob/main/screenshot/Screenshot%202025-04-21%20174313.png?raw=true)

![[DATA IN TABLE](https://github.com/Habimana06/Tue_26432_HabimanaHappyNtaganira_Wildlife-Conservation-Tracking-System/blob/main/screenshot/Screenshot%202025-04-21%20174330.png?raw=true)

![[DATA IN TABLE](https://github.com/Habimana06/Tue_26432_HabimanaHappyNtaganira_Wildlife-Conservation-Tracking-System/blob/main/screenshot/Screenshot%202025-04-21%20174404.png?raw=true)

![DATA IN TABLE](https://github.com/Habimana06/Tue_26432_HabimanaHappyNtaganira_Wildlife-Conservation-Tracking-System/blob/main/screenshot/Screenshot%202025-04-21%20174424.png?raw=true)



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
     - Go to `File > Open` and browse to `your_script.sql`
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
   - Or type `@your_script.sql` in SQL*Plus:
     ```sql
     @C:\path\to\your_script.sql
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

