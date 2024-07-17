-- Create the table 
CREATE TABLE CLIENTS (
    CLIENTNO VARCHAR2(10),
    NAME VARCHAR2(50),
    CITY VARCHAR2(50),
    PINCODE VARCHAR2(10),
    STATE VARCHAR2(30),
    BALDUE NUMBER
);

-- Insert Data
INSERT INTO CLIENTS (CLIENTNO, NAME, CITY, PINCODE, STATE, BALDUE) VALUES ('C00001', 'Ivan Bayross', 'Mumbai', '400054', 'Maharashtra', 15000);
INSERT INTO CLIENTS (CLIENTNO, NAME, CITY, PINCODE, STATE, BALDUE) VALUES ('C00002', 'Mamta Mazumdar', 'Madras', '780001', 'Tamil Nadu', 0);
INSERT INTO CLIENTS (CLIENTNO, NAME, CITY, PINCODE, STATE, BALDUE) VALUES ('C00003', 'Chhaya Bankar', 'Mumbai', '400057', 'Maharashtra', 5000);
INSERT INTO CLIENTS (CLIENTNO, NAME, CITY, PINCODE, STATE, BALDUE) VALUES ('C00004', 'Ashwini Joshi', 'Bangalore', '560001', 'Karnataka', 0);
INSERT INTO CLIENTS (CLIENTNO, NAME, CITY, PINCODE, STATE, BALDUE) VALUES ('C00005', 'Hansel Colaco', 'Mumbai', '400060', 'Maharashtra', 2000);
INSERT INTO CLIENTS (CLIENTNO, NAME, CITY, PINCODE, STATE, BALDUE) VALUES ('C00006', 'Deepak Sharma', 'Mangalore', '560050', 'Karnataka', 0);

-- 2. Exercise on retrieving records from the table:
-- 2. a. Display the names of all the clients.
SELECT name
FROM clients;

-- 2. b. Retrieve the entire contents of the CLIENT_MASTER table.
SELECT *
FROM clients;

-- 2. c. Retrieve the list of names, city and the state of all the clients.
SELECT name, city, state
FROM clients;

-- 2. d. List all the clients who are located in Mumbai
SELECT *
FROM clients
WHERE city = 'Mumbai';

-- 2. e. Find the names of client who carries a balance of 15,000/-
SELECT * FROM clients
WHERE baldue >= 15000;

-- 2. f. List the details of the clients whose name starts with ‘M’.
SELECT * FROM clients 
WHERE name LIKE 'M%';

-- 2. g. List the details of clients who are staying in either Maharastra or in Karnataka. 
SELECT * FROM clients
WHERE state = 'Maharashtra' OR state = 'Karnataka';
-- or 
SELECT * FROM clients
WHERE state IN ('Maharashtra', 'Karnataka');


-- 3.Exercise on updating records in a table:
-- 3. a. Change the city of clientno ‘C00005’ to Bangalore.
UPDATE clients
SET city = 'Bangalore'
WHERE clientno = 'C00005';

-- 3. b. Change the balance due of clientno ‘C00001’ to Rs. 1000.
UPDATE clients
SET BALDUE = 1000
WHERE clientno = 'C00001';

-- 3. c. Change the city of the client to Pune
-- which client?
UPDATE clients
SET city = 'Pune'
WHERE clientno = 'C00001';

-- 4. Exercise on deleting records in a table:
-- 4. a. Delete all clients from the CLIENT_MASTER.
DELETE FROM clients;
-- or
TRUNCATE TABLE clients;

-- 4. b. Delete from CLIENT_MASTER where the column state holds the value ‘Tamil Nadu’.
DELETE FROM CLIENTS 
WHERE state = 'Tamil Nadu';
