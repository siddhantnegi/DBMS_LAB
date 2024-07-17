-- Create the table
CREATE TABLE Employee (
    EmpId VARCHAR2(3) CONSTRAINT pk_employee_empID PRIMARY KEY CHECK (EmpId LIKE 'E%'),
    Ename VARCHAR2(25) NOT NULL,
    DOB DATE NOT NULL,
    DOJ DATE NOT NULL,
    Salary NUMBER(7) NOT NULL CHECK (Salary >= 0),
    Adhar NUMBER(12) UNIQUE, -- CONSTRAINT CHK_Adhar_Length CHECK (LENGTH(Adhar) = 12) won't work here, need to apply this constraint on table level.
    CONSTRAINT CHK_Adhar_Length CHECK (LENGTH(Adhar) = 12),
    CONSTRAINT CHK_DOB_DOJ CHECK (DOJ > DOB)
);

-- Dummy data for practice
INSERT INTO Employee VALUES ('E05', 'Naughty', TO_DATE('1999-09-09', 'YYYY-MM-DD'), TO_DATE('2009-09-09', 'YYYY-MM-DD'), 6969, 696969696969);
INSERT INTO Employee VALUES ('E01', 'Ram', TO_DATE('1990-MAY-15', 'YYYY-MON-DD'), TO_DATE('2020-02-20', 'YYYY-MM-DD'), 50000, 123456789012);
INSERT INTO Employee VALUES ('E02', 'John', TO_DATE('1985-10-25', 'YYYY-MM-DD'), TO_DATE('2008-03-10', 'YYYY-MM-DD'), 68000, 234567890123);
INSERT INTO Employee VALUES ('E03', 'Shan', TO_DATE('1993-12-08', 'YYYY-MM-DD'), TO_DATE('2019-09-05', 'YYYY-MM-DD'), 55000, 345678901234);
INSERT INTO Employee VALUES ('E04', 'David', TO_DATE('1988-04-20', 'YYYY-MM-DD'), TO_DATE('2012-01-15', 'YYYY-MM-DD'), 70000, 456789012345);
INSERT INTO Employee VALUES ('E06', 'Anchal', TO_DATE('1991-02-28', 'YYYY-MM-DD'), TO_DATE('2014-04-25', 'YYYY-MM-DD'), 65000, 678901234567);

-- 2.1 List the employee details who joined on a particular date
SELECT * FROM Employee WHERE DOJ = TO_DATE('2014-04-25', 'YYYY-MM-DD');

-- 2.2 Write a query to list the employees with Hiredate in the format like February 22, 1991
SELECT EmpId, Ename, TO_CHAR(DOJ, 'Month DD, YYYY') AS Hiredate FROM Employee;

-- 2.3 Write a query to list the employees who joined before 2018
SELECT * FROM Employee WHERE DOJ < TO_DATE('2018-01-01', 'YYYY-MM-DD');

-- 2.4 Write a query to list the employees who joined in the month January
SELECT * FROM Employee WHERE EXTRACT(MONTH FROM DOJ) = 1;

-- 2.5 Write a query to list the employees who have joined in the year 2019
SELECT * FROM Employee WHERE EXTRACT(YEAR FROM DOJ) = 2019;

-- 2.6 Write a query to list the employee details according to the date of joining (recent joining should come first)
SELECT * FROM Employee ORDER BY DOJ desc;

-- 2.7 Write a query to list the employee details along with their experience
SELECT EmpId, Ename, DOJ, DATEDIFF(sysdate, DOJ) AS Experience FROM Employee;

-- 2.8 Write a query to list those employees whose salary is an odd value
SELECT * FROM Employee WHERE MOD(Salary, 2) = 1;

-- 2.9 Write a query to list the employees of id E001 or E10, joined in the year 1991
SELECT * FROM Employee WHERE (EmpId = 'E01' OR EmpId = 'E10') AND EXTRACT(YEAR FROM DOJ) = 1991;

-- 2.10 Write a query in SQL to list the employees who joined in any year except the month February
SELECT * FROM Employee WHERE EXTRACT(MONTH FROM DOJ) != 2;

-- 2.11 Write a query to display happy birthday to those employees who are eligible to get this message
SELECT EmpId, Ename, DOB FROM Employee WHERE EXTRACT(MONTH FROM DOB) = EXTRACT(MONTH FROM SYSDATE) AND EXTRACT(DAY FROM DOB) = EXTRACT(DAY FROM SYSDATE);

-- 2.12 Display the employee id, Name and Date of birth of all the employees
SELECT EmpId, Ename, TO_CHAR(DOB, 'DDth Month YYYY') AS DOB FROM Employee;
