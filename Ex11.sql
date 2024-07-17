-- Procedure in PL/SQL

CREATE OR REPLACE PROCEDURE find_min (
    num1 IN NUMBER,
    num2 IN NUMBER,
    minval OUT NUMBER
) AS
BEGIN
    IF num1 < num2 THEN
        minval := num1;
    ELSE
        minval := num2;
    END IF;
END;
/

-- Example Usage:
DECLARE
    num1 NUMBER := 10;
    num2 NUMBER := 20;
    result NUMBER;
BEGIN
    find_min(num1, num2, result);
    DBMS_OUTPUT.PUT_LINE('Minimum value: ' || result);
END;
/

-- Function in PL/SQL
CREATE OR REPLACE FUNCTION find_min (
    num1 IN NUMBER,
    num2 IN NUMBER
) RETURN NUMBER
IS
    minval NUMBER;
BEGIN
    IF num1 < num2 THEN
        minval := num1;
    ELSE
        minval := num2;
    END IF;
    RETURN minval;
END;
/

-- Example Usage:
DECLARE
    num1 NUMBER := 10;
    num2 NUMBER := 20;
    result NUMBER;
BEGIN
    result := find_min(num1, num2);
    DBMS_OUTPUT.PUT_LINE('Minimum value: ' || result);
END;
/
