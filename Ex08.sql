-- Note – Questions from 1 to 14 refer the sample tables 1. Salesman, 2. Customer, 3. Order.
-- 1. Create the salesman table
CREATE TABLE salesman (
    salesman_id  INT,
    name         VARCHAR(50),
    city         VARCHAR(50),
    commission   DECIMAL(5, 2)
);

-- Insert data into salesman table
INSERT INTO salesman VALUES (5001, 'James Hoog', 'New York', 0.15);
INSERT INTO salesman VALUES (5002, 'Nail Knite', 'Paris', 0.13);
INSERT INTO salesman VALUES (5005, 'Pit Alex', 'London', 0.11);
INSERT INTO salesman VALUES (5006, 'Mc Lyon', 'Paris', 0.14);
INSERT INTO salesman VALUES (5007, 'Paul Adam', 'Rome', 0.13);
INSERT INTO salesman VALUES (5003, 'Lauson Hen', 'San Jose', 0.12);

-- 2. Create the customer table
CREATE TABLE customer (
    customer_id   INT,
    cust_name     VARCHAR(50),
    city          VARCHAR(50),
    grade         INT,
    salesman_id   INT
);

-- Insert data into customer table
INSERT INTO customer VALUES (3002, 'Nick Rimando', 'New York', 100, 5001);
INSERT INTO customer VALUES (3007, 'Brad Davis', 'New York', 200, 5001);
INSERT INTO customer VALUES (3005, 'Graham Zusi', 'California', 200, 5002);
INSERT INTO customer VALUES (3008, 'Julian Green', 'London', 300, 5002);
INSERT INTO customer VALUES (3004, 'Fabian Johnson', 'Paris', 300, 5006);
INSERT INTO customer VALUES (3009, 'Geoff Cameron', 'Berlin', 100, 5003);
INSERT INTO customer VALUES (3003, 'Jozy Altidor', 'Moscow', 200, 5007);
INSERT INTO customer VALUES (3001, 'Brad Guzan', 'London', NULL, 5005);

-- 3. Create the orders table
CREATE TABLE orders (
    ord_no       INT,
    purch_amt    DECIMAL(10, 2),
    ord_date     DATE,
    customer_id  INT,
    salesman_id  INT
);

-- Insert data into orders table
INSERT INTO orders VALUES (70001, 150.5, TO_DATE('2012-10-05', 'YYYY-MM-DD'), 3005, 5002);
INSERT INTO orders VALUES (70009, 270.65, TO_DATE('2012-09-10', 'YYYY-MM-DD'), 3001, 5005);
INSERT INTO orders VALUES (70002, 65.26, TO_DATE('2012-10-05', 'YYYY-MM-DD'), 3002, 5001);
INSERT INTO orders VALUES (70004, 110.5, TO_DATE('2012-08-17', 'YYYY-MM-DD'), 3009, 5003);
INSERT INTO orders VALUES (70007, 948.5, TO_DATE('2012-09-10', 'YYYY-MM-DD'), 3005, 5002);
INSERT INTO orders VALUES (70005, 2400.6, TO_DATE('2012-07-27', 'YYYY-MM-DD'), 3007, 5001);
INSERT INTO orders VALUES (70008, 5760, TO_DATE('2012-09-10', 'YYYY-MM-DD'), 3002, 5001);
INSERT INTO orders VALUES (70010, 1983.43, TO_DATE('2012-10-10', 'YYYY-MM-DD'), 3004, 5006);
INSERT INTO orders VALUES (70003, 2480.4, TO_DATE('2012-10-10', 'YYYY-MM-DD'), 3009, 5003);
INSERT INTO orders VALUES (70012, 250.45, TO_DATE('2012-06-27', 'YYYY-MM-DD'), 3008, 5002);
INSERT INTO orders VALUES (70011, 75.29, TO_DATE('2012-08-17', 'YYYY-MM-DD'), 3003, 5007);
INSERT INTO orders VALUES (70013, 3045.6, TO_DATE('2012-04-25', 'YYYY-MM-DD'), 3002, 5001);

-- Q1: Write a SQL statement to prepare a list with salesman name, customer name and their cities for the salesmen and customer who belongs to the same city.
SELECT s.name AS salesman_name, c.cust_name AS customer_name, s.city 
FROM salesman s 
JOIN customer c ON s.city = c.city;

-- Q2: Write a SQL statement to make a list with order no, purchase amount, customer name and their cities for those orders which order amount between 500 and 2000.
SELECT o.ord_no, o.purch_amt, c.cust_name, c.city 
FROM orders o 
JOIN customer c ON o.customer_id = c.customer_id 
WHERE o.purch_amt BETWEEN 500 AND 2000;

-- Q3: Write a SQL statement to know which salesman are working for which customer.
SELECT s.name AS salesman_name, c.cust_name AS customer_name 
FROM salesman s 
JOIN customer c ON s.salesman_id = c.salesman_id;

-- Q4: Write a SQL statement to find the list of customers who appointed a salesman for their jobs who gets a commission from the company is more than 12%.
SELECT c.cust_name 
FROM customer c 
JOIN salesman s ON c.salesman_id = s.salesman_id 
WHERE s.commission > 0.12;

-- Q5: Write a SQL statement to find the list of customers who appointed a salesman for their jobs who does not live in the same city where their customer lives, and gets a commission is above 12%.
SELECT c.cust_name 
FROM customer c 
JOIN salesman s ON c.salesman_id = s.salesman_id 
WHERE s.city <> c.city AND s.commission > 0.12;

-- Q6: Write a SQL statement to find the details of an order i.e. order number, order date, amount of order, which customer gives the order and which salesman works for that customer and how much commission he gets for an order.
SELECT o.ord_no, o.ord_date, o.purch_amt, c.cust_name, s.name AS salesman_name, s.commission 
FROM orders o 
JOIN customer c ON o.customer_id = c.customer_id 
JOIN salesman s ON o.salesman_id = s.salesman_id;

-- Q7: Write a SQL statement to make a list in ascending order for the customer who works either through a salesman or by own.
SELECT c.cust_name 
FROM customer c 
ORDER BY c.cust_name ASC;

-- Q8: Write a SQL statement to make a list in ascending order for the customer who holds a grade less than 300 and works either through a salesman or by own.
SELECT c.cust_name 
FROM customer c 
WHERE c.grade < 300 
ORDER BY c.cust_name ASC;

-- Q9: Write a SQL statement to make a report with customer name, city, order number, order date, and order amount in ascending order according to the order date to find that either any of the existing customers have placed no order or placed one or more orders.
SELECT c.cust_name, c.city, o.ord_no, o.ord_date, o.purch_amt 
FROM customer c 
LEFT JOIN orders o ON c.customer_id = o.customer_id 
ORDER BY o.ord_date ASC;

-- Q10: Write a SQL statement to make a report with customer name, city, order number, order date, order amount, salesman name and commission to find that either any of the existing customers have placed no order or placed one or more orders by their salesman or by own.
SELECT c.cust_name, c.city, o.ord_no, o.ord_date, o.purch_amt, s.name AS salesman_name, s.commission 
FROM customer c 
LEFT JOIN orders o ON c.customer_id = o.customer_id 
LEFT JOIN salesman s ON c.salesman_id = s.salesman_id 
ORDER BY o.ord_date ASC;

-- Q11: Write a SQL statement to make a list in ascending order for the salesmen who works either for one or more customer or not yet join under any of the customers.
SELECT DISTINCT s.name 
FROM salesman s 
LEFT JOIN customer c ON s.salesman_id = c.salesman_id 
ORDER BY s.name ASC;

-- Q12: Write a SQL statement to make a list for the salesmen who works either for one or more customer or not yet join under any of the customers who placed either one or more orders or no order to their supplier.
SELECT DISTINCT s.name 
FROM salesman s 
LEFT JOIN customer c ON s.salesman_id = c.salesman_id 
LEFT JOIN orders o ON c.customer_id = o.customer_id 
ORDER BY s.name ASC;

-- Q13: Write a SQL statement to make a list for the salesmen who either work for one or more customers or yet to join any of the customer. The customer may have placed, either one or more orders on or above order amount 2000 and must have a grade, or he may not have placed any order to the associated supplier.
SELECT DISTINCT s.name 
FROM salesman s 
LEFT JOIN customer c ON s.salesman_id = c.salesman_id 
LEFT JOIN orders o ON c.customer_id = o.customer_id 
WHERE (o.purch_amt >= 2000 AND c.grade IS NOT NULL) OR o.ord_no IS NULL 
ORDER BY s.name ASC;

-- Q14: Write a SQL statement to make a cartesian product between salesman and customer i.e. each salesman will appear for all customers and vice versa.
SELECT s.name AS salesman_name, c.cust_name 
FROM salesman s, customer c;

-- Note – For questions 15 to 19 use sample table 4. company_mast and 5. item_mast
-- 4. Create the company_mast table
CREATE TABLE company_mast (
    com_id   INT,
    com_name VARCHAR(50)
);

-- Insert data into company_mast table
INSERT INTO company_mast VALUES (11, 'Samsung');
INSERT INTO company_mast VALUES (12, 'iBall');
INSERT INTO company_mast VALUES (13, 'Epsion');
INSERT INTO company_mast VALUES (14, 'Zebronics');
INSERT INTO company_mast VALUES (15, 'Asus');
INSERT INTO company_mast VALUES (16, 'Frontech');

-- 5. Create the item_mast table.
CREATE TABLE item_mast (
    pro_id    INT,
    pro_name  VARCHAR(50),
    pro_price DECIMAL(10, 2),
    pro_com   INT
);

-- Insert data into item_mast table
INSERT INTO item_mast VALUES (101, 'Mother Board', 3200, 15);
INSERT INTO item_mast VALUES (102, 'Key Board', 450, 16);
INSERT INTO item_mast VALUES (103, 'ZIP drive', 250, 14);
INSERT INTO item_mast VALUES (104, 'Speaker', 550, 16);
INSERT INTO item_mast VALUES (105, 'Monitor', 5000, 11);
INSERT INTO item_mast VALUES (106, 'DVD drive', 900, 12);
INSERT INTO item_mast VALUES (107, 'CD drive', 800, 12);
INSERT INTO item_mast VALUES (108, 'Printer', 2600, 13);
INSERT INTO item_mast VALUES (109, 'Refill cartridge', 350, 13);
INSERT INTO item_mast VALUES (110, 'Mouse', 250, 12);

-- Q15: Write a SQL query to display all the data from the item_mast, including all the data for each item's producer company.
SELECT i.*, c.com_name 
FROM item_mast i 
JOIN company_mast c ON i.pro_com = c.com_id;

-- Q16: Write a SQL query to display the item name, price, and company name of all the products.
SELECT i.pro_name, i.pro_price, c.com_name 
FROM item_mast i 
JOIN company_mast c ON i.pro_com = c.com_id;

-- Q17: Write a SQL query to display the average price of items of each company, showing the name of the company.
SELECT c.com_name, AVG(i.pro_price) AS avg_price 
FROM item_mast i 
JOIN company_mast c ON i.pro_com = c.com_id 
GROUP BY c.com_name;

-- Q18: Write a SQL query to display the names of the company whose products have an average price larger than or equal to Rs. 350.
SELECT c.com_name 
FROM item_mast i 
JOIN company_mast c ON i.pro_com = c.com_id 
GROUP BY c.com_name 
HAVING AVG(i.pro_price) >= 350;

-- Q19: Write a SQL query to display the name of each company along with the ID and price for their most expensive product.
SELECT c.com_name, i.pro_id, i.pro_price 
FROM item_mast i 
JOIN company_mast c ON i.pro_com = c.com_id 
WHERE (i.pro_price, i.pro_com) IN (
    SELECT MAX(pro_price), pro_com 
    FROM item_mast 
    GROUP BY pro_com
);

-- Note – For questions 20 to 23 use the sample tables 6. emp_deptmen, and 7. emp_details
-- 6. Create the emp_department table
CREATE TABLE emp_department (
    dpt_code       INT,
    dpt_name       VARCHAR(50),
    dpt_allotment  INT
);

-- Insert data into emp_department table
INSERT INTO emp_department VALUES (57, 'IT', 65000);
INSERT INTO emp_department VALUES (63, 'Finance', 150000);
INSERT INTO emp_department VALUES (47, 'HR', 2400000);
INSERT INTO emp_department VALUES (27, 'RD', 55000);
INSERT INTO emp_department VALUES (89, 'QC', 75000);

-- 7. Create the emp_details table
CREATE TABLE emp_details (
    emp_idno    INT,
    emp_fname   VARCHAR(50),
    emp_lname   VARCHAR(50),
    emp_dept    INT
);

-- Insert data into emp_details table
INSERT INTO emp_details VALUES (127233, 'Michale', 'Robbin', 57);
INSERT INTO emp_details VALUES (526689, 'Carlos', 'Snares', 63);
INSERT INTO emp_details VALUES (843795, 'Enric', 'Dosio', 57);
INSERT INTO emp_details VALUES (328717, 'Jhon', 'Snares', 63);
INSERT INTO emp_details VALUES (448527, 'Joseph', 'Dosni', 47);
INSERT INTO emp_details VALUES (659431, 'Zanifer', 'Emily', 47);
INSERT INTO emp_details VALUES (847674, 'Kuleswar', 'Sitaraman', 57);
INSERT INTO emp_details VALUES (748681, 'Henrey', 'Gabriel', 47);
INSERT INTO emp_details VALUES (555935, 'Alex', 'Manuel', 57);
INSERT INTO emp_details VALUES (535969, 'George', 'Mardy', 27);
INSERT INTO emp_details VALUES (733843, 'Mario', 'Saule', 63);
INSERT INTO emp_details VALUES (631548, 'Alain', 'Snappy', 27);
INSERT INTO emp_details VALUES (839139, 'Maria', 'Foster', 57);

-- Q20: Write a query in SQL to display all the data of employees including their department.
SELECT e.*, d.dpt_name 
FROM emp_details e 
JOIN emp_department d ON e.emp_dept = d.dpt_code;

-- Q21: Write a query in SQL to display the first name and last name of each employee, along with the name and sanction amount for their department.
SELECT e.emp_fname, e.emp_lname, d.dpt_name, d.dpt_allotment 
FROM emp_details e 
JOIN emp_department d ON e.emp_dept = d.dpt_code;

-- Q22: Write a query in SQL to find the first name and last name of employees working for departments with a budget more than Rs. 50000.
SELECT e.emp_fname, e.emp_lname 
FROM emp_details e 
JOIN emp_department d ON e.emp_dept = d.dpt_code 
WHERE d.dpt_allotment > 50000;

-- Q23: Write a query in SQL to find the names of departments where more than two employees are working.
SELECT d.dpt_name 
FROM emp_details e 
JOIN emp_department d ON e.emp_dept = d.dpt_code 
GROUP BY d.dpt_name 
HAVING COUNT(e.emp_idno) > 2;
