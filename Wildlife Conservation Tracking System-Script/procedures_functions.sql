-- ==========================================
-- Wildlife Conservation Tracking System Setup
-- ==========================================

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

-- ===================
-- Optional: Query View
-- ===================

-- Get most recent incident per animal
SELECT * FROM Animal_Incident_Rank_View
WHERE incident_rank = 1;
