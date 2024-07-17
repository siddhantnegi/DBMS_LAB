-- 1. Creating the table
CREATE TABLE Employee (
    EmpId NUMBER,
    Name VARCHAR2(50),
    DOJ DATE,
    JobId VARCHAR2(20),
    Salary NUMBER
);

-- Inserting the records
INSERT INTO Employee VALUES (100, 'Aman Jian', TO_DATE('17-June-2017', 'DD-Month-YYYY'), 'AD_PRES', 24000.00);
INSERT INTO Employee VALUES (101, 'Yash Kumar', TO_DATE('15-July-2019', 'DD-Month-YYYY'), 'AD_VP', 17000.00);
INSERT INTO Employee VALUES (102, 'Ayushi', TO_DATE('12-Aug-2017', 'DD-Month-YYYY'), 'IT_PROG', 9000.00);
INSERT INTO Employee VALUES (103, 'Kamal', TO_DATE('15-September-2016', 'DD-Month-YYYY'), 'IT_PROG', 6000.00);
INSERT INTO Employee VALUES (105, 'Madhav Mohan', TO_DATE('14-July-2018', 'DD-Month-YYYY'), 'IT_PROG', 4000.00);
INSERT INTO Employee VALUES (106, 'Astha Sharma', TO_DATE('27-June-2017', 'DD-Month-YYYY'), 'PU_CLERK', 2500.00);

-- 1.1 Query to display the name for those employees who get more salary than the employee whose id is 104.
SELECT Name
FROM Employee
WHERE Salary > (SELECT Salary FROM Employee WHERE EmpId = 102);

/*1.2 Query to display the name, salary, department id, job id for those employees who work in the same 
designation as the employee whose id is 103. */
SELECT Name, Salary, JobId
FROM Employee
WHERE JobId = (SELECT JobId FROM Employee WHERE EmpId = 103);

/* 1.3 Query to display the name, salary, department id for those employees who earn such an amount of
salary which is the smallest salary of any of the departments. */
SELECT Name, Salary, JobId
FROM Employee
WHERE Salary = (SELECT MIN(Salary) FROM Employee);

-- 1.4 Query to display the employee details who are having the same date of joining as of employee having id 106.
SELECT *
FROM Employee
WHERE DOJ = (SELECT DOJ FROM Employee WHERE EmpId = 106);

-- 1.5 Query to display the employee details who are having the date of joining after the date of joining of employee having ID 102.
SELECT *
FROM Employee
WHERE DOJ > (SELECT DOJ FROM Employee WHERE EmpId = 102);
