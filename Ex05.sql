-- Q1 Demonstrate the use of all string functions available in SQL.
SELECT UPPER('Hello World') FROM dual; -- Returns: 'HELLO WORLD'
SELECT LOWER('Hello World') FROM dual; -- Returns: 'hello world'
SELECT INITCAP('hello world') FROM dual; -- Returns: 'Hello World'
SELECT LENGTH('hello world') FROM dual; -- Returns: 11

SELECT SUBSTR('Hello World', 7) FROM dual; -- Return: 'World'
SELECT SUBSTR('Hello World', 7, 3) FROM dual; -- Return: 'Wor'
SELECT SUBSTR('Hello World', -7, 3) FROM dual; -- Returns: 'o W'

SELECT CONCAT('Hello', 'World') FROM dual; -- Returns: 'HelloWorld'
SELECT 'Hello' || ' ' || 'World' FROM dual; -- Returns: 'Hello World'

SELECT REVERSE('Hello World') from dual; -- Returns: 'dlroW olleH'

-- Q2
CREATE TABLE Student (
    Roll INT CONSTRAINT pk_student_roll PRIMARY KEY,
    F_Name VARCHAR2(15),
    M_Name VARCHAR2(15),
    L_Name VARCHAR2(15),
    Sec CHAR(1),
    City VARCHAR2(30),
    Area VARCHAR2(30),
    HouseNo VARCHAR2(20),
    Div INT
);

INSERT INTO Student VALUES (1, 'Akash', 'Kumar', 'Jian', 'A', 'Ghaziabad', 'Rakesh Marg', 'C-355', 1);
INSERT INTO Student VALUES (2, 'Manav', 'Mohan', 'Sharma', 'A', 'Ghaziabad', 'Raj Nagar', 'D-211', 2);
INSERT INTO Student VALUES (3, 'Chandra', 'Mohan', 'Batra', 'B', 'Meerut', 'Minto Road', 'A-201', 3);
INSERT INTO Student VALUES (4, 'Rakesh', 'Chandra', 'Gupta', 'B', 'Kanpur', 'Nehru Marg', 'A-145', NULL);
INSERT INTO Student VALUES (5, 'Sagar', 'Pratap', 'Singh', 'A', 'Meerut', 'Gandhi Marg', 'C-35', 0);


-- i) Display Roll Number and complete name of all the students
SELECT ROLL, F_NAME || ' ' || M_NAME || ' ' || L_NAME AS NAME 
FROM STUDENT;

-- ii) Display Roll Number, Name and complete address of all the students.
SELECT Roll, F_Name || ' ' || M_Name || ' ' || L_Name AS Name, 
    HouseNo || ', ' || Area || ', ' || City AS Address
FROM Student;

-- iii) Display Roll number, Name of all the students. (Note – The name should be displayed as A.K.Jain )
SELECT Roll, 
    SUBSTR(F_Name, 1, 1) || '.' || SUBSTR(M_Name, 1, 1) || '.' || L_Name AS Name
FROM Student;

-- iv) Display all the student information according to ascending order of Section.
SELECT * 
FROM STUDENT
ORDER BY SEC ASC;

-- v) Display all the student information according to descending order of Section.
SELECT * 
FROM STUDENT
ORDER BY SEC DESC;

-- vi) Sort all the records according to section and then according to First Name.
SELECT *
FROM Student
ORDER BY Sec, F_Name;

-- vii) Display Roll number, name and city of all the students. (Note – City names should be left padded with 5 *).
SELECT Roll,  F_NAME,
       LPAD(City, LENGTH(City) + 5, '*') AS City
FROM Student;

-- viii) Display those student details whose division has not been awarded.
SELECT *
FROM STUDENT
WHERE DIV IS NULL;

-- ix) Display the cities from where the students are from.
SELECT DISTINCT CITY
FROM STUDENT;

-- x) Display Roll number, First Name and the division got. (Note – Division should be displayed as 1 - FIRST, 2 – SECOND, 3 – THIRD, 0- FAIL, NULL – NOT AWARDED)
SELECT Roll, 
       F_Name, 
       CASE Div
           WHEN 1 THEN 'FIRST'
           WHEN 2 THEN 'SECOND'
           WHEN 3 THEN 'THIRD'
           WHEN 0 THEN 'FAIL'
           ELSE 'NOT AWARDED'
       END AS Division
FROM Student;


-- xi) Display Roll Number, First Name, Section of all the students. (Note – Section A should be displayed as 1 and Section B should be displayed as 2)
SELECT ROLL,
		F_NAME,
		CASE SEC
			WHEN 'A' THEN 1
			WHEN 'B' THEN 2
		END AS SEC
FROM STUDENT;

-- Q3
SELECT 
    Empcode,
    REGEXP_REPLACE(Empname, '\d+', '') AS Empname
FROM TABLE_NAME;

-- Q4
SELECT SUBSTR(F_NAME, 1, 1) || '.' || SUBSTR(M_NAME, 1, 1) || '.' || L_NAME AS NAME
FROM TABLE_NAME;

-- Q5
SELECT 
    Sname,
    CASE 
        WHEN Marks >= 35 THEN 'Pass'
        ELSE 'Fail'
    END AS Result
FROM TABLE_NAME;
