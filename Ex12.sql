-- Cursor in PL/SQL
-- Step 1: Declare the cursor
DECLARE
    CURSOR emp_cursor IS
        SELECT emp_id, fname, lname
        FROM emp
        WHERE department_id = 10;

    v_id emp.emp_id%TYPE;
    v_fname emp.fname%TYPE;
    v_lname emp.lname%TYPE;
BEGIN
    -- Step 2: Open the cursor
    OPEN emp_cursor;

    -- Step 3: Fetch from the cursor
    LOOP
        FETCH emp_cursor INTO v_id, v_fname, v_lname;
        EXIT WHEN emp_cursor%NOTFOUND;

        -- Process each row
        DBMS_OUTPUT.PUT_LINE('Employee ID: ' || v_id || ', Name: ' || v_fname || ' ' || v_lname);
    END LOOP;

    -- Step 4: Close the cursor
    CLOSE emp_cursor;
END;
/

-- Trigger in PL/SQL

CREATE TABLE emp (
    emp_id NUMBER,
    name VARCHAR2(50),
    city VARCHAR2(50),
    salary NUMBER
);

CREATE TABLE emp_salary_archive(
    emp_id NUMBER,
    old_salary NUMBER,
    new_salary NUMBER,
    change_date DATE
);

INSERT INTO emp VALUES (1, 'James Hoog', 'New York', 80000);
INSERT INTO emp VALUES (2, 'Nail Knite', 'Paris', 84000);
INSERT INTO emp VALUES (3, 'Pit Alex', 'London', 89000);
INSERT INTO emp VALUES (4, 'Mc Lyon', 'Paris', 69000);
INSERT INTO emp VALUES (5, 'Paul Adam', 'Rome', 70000);
INSERT INTO emp VALUES (6, 'Lauson Hen', 'San Jose', 56000);

CREATE OR REPLACE TRIGGER emp_history
    AFTER UPDATE OF salary OR DELETE  -- Trigger fires only when there's an update in salary column or entier row is deleted. 
    ON emp
    FOR EACH ROW
BEGIN
    IF UPDATING THEN
        INSERT INTO emp_salary_archive(emp_id, old_salary, new_salary, change_date)
        VALUES (:OLD.emp_id, :OLD.salary, :NEW.salary, SYSDATE);
    ELSIF DELETING THEN
        INSERT INTO emp_salary_archive(emp_id, old_salary, new_salary, change_date)
        VALUES (:OLD.emp_id, :OLD.salary, NULL, SYSDATE);
    END IF;
END;
/

-- Example Usage:

SELECT * FROM emp; -- 6 records found
SELECT * FROM emp_salary_archive; -- 0 records found

UPDATE emp
SET salary = 84000
WHERE emp_id = 4;

SELECT * FROM emp; -- 6 records (1 record is updated)
SELECT * FROM emp_salary_archive; -- 1 record found
