-- Creating table
CREATE TABLE orders (
    ord_no NUMBER,
    purch_amt NUMBER,
    ord_date DATE,
    customer_id NUMBER,
    salesman_id NUMBER
);

-- Inserting dummy data.
INSERT INTO orders VALUES (70001, 150.5, TO_DATE('2012-10-05', 'YYYY-MM-DD'), 3005, 5002);
INSERT INTO orders VALUES (70009, 270.65, TO_DATE('2012-09-10', 'YYYY-MM-DD'), 3001, 5005);
INSERT INTO orders VALUES (70002, 65.26, TO_DATE('2012-10-05', 'YYYY-MM-DD'), 3002, 5001);
INSERT INTO orders VALUES (70004, 110.5, TO_DATE('2012-08-17', 'YYYY-MM-DD'), 3009, 5003);
INSERT INTO orders VALUES (70007, 948.5, TO_DATE('2012-09-10', 'YYYY-MM-DD'), 3005, 5002);
INSERT INTO orders VALUES (70005, 2400.6, TO_DATE('2012-07-27', 'YYYY-MM-DD'), 3007, 5001);
INSERT INTO orders VALUES (70008, 5760.0, TO_DATE('2012-09-10', 'YYYY-MM-DD'), 3002, 5001);
INSERT INTO orders VALUES (70010, 1983.43, TO_DATE('2012-10-10', 'YYYY-MM-DD'), 3004, 5006);
INSERT INTO orders VALUES (70003, 2480.4, TO_DATE('2012-10-10', 'YYYY-MM-DD'), 3009, 5003);
INSERT INTO orders VALUES (70012, 250.45, TO_DATE('2012-06-27', 'YYYY-MM-DD'), 3008, 5002);
INSERT INTO orders VALUES (70011, 75.29, TO_DATE('2012-08-17', 'YYYY-MM-DD'), 3003, 5007);
INSERT INTO orders VALUES (70013, 3045.6, TO_DATE('2012-04-25', 'YYYY-MM-DD'), 3002, 5001);

-- 1. write a SQL query to calculate total purchase amount of all orders. Return total purchase amount.
SELECT SUM(purch_amt) AS Total_Purchase_Amount from orders;

-- 2. write a SQL query to calculate average purchase amount of all orders. Return average purchase amount.
SELECT AVG(purch_amt) as Average_Purchase_Amount from orders;

-- 3. write a SQL query to find the number of salespeople.
SELECT COUNT(DISTINCT salesman_id) AS No_Of_Salespeople from orders;

-- 4. write a SQL query to find the maximum purchase amount.
SELECT MAX(purch_amt) AS Max_Purchase_Amount from orders;

-- 5. write a SQL query to find the minimum purchase amount. 
SELECT MIN(purch_amt) AS Max_Purchase_Amount from orders;

-- 6. write a SQL query to find the highest purchase amount ordered by each customer. Return customer ID, maximum purchase amount. 
SELECT customer_id, MAX(purch_amt) AS Maximum_Purchase_Amount from orders GROUP BY customer_id;

-- 7. write a SQL query to find the highest purchase amount ordered by each customer on a particular date. Return, order date and highest purchase amount. 
SELECT ord_date, MAX(purch_amt) AS Maximum_Purchase_Amount from orders WHERE ord_date = '2012-08-17' GROUP BY ord_date;

-- 8. write a SQL query to find the highest purchase amount on '2012-08-17' by each salesperson. Return salesperson ID, purchase amount. 
SELECT salesman_id, MAX(purch_amt) AS Maximum_Purchase_Amount from orders WHERE ord_date = '2012-08-17' GROUP BY salesman_id;

-- 9. write a SQL query to find highest order (purchase) amount by each customer in a particular order date. Filter the result by highest order (purchase) amount above 2000.00. Return customer id, order date and maximum purchase amount. 
SELECT customer_id, ord_date, MAX(purch_amt) AS Maximum_Purchase_Amount from orders GROUP BY customer_id, ord_date HAVING MAX(purch_amt) > 2000.00;

-- 10. write a SQL query to find the maximum order (purchase) amount in the range 2000, 6000 (Begin and end values are included.) by combination of each customer and order date. Return customer id, order date and maximum purchase amount. 
SELECT customer_id, ord_date, MAX(purch_amt) AS Maximum_Purchase_Amount from orders WHERE purch_amt BETWEEN 2000 AND 6000 GROUP BY customer_id, ord_date;

-- 11. write a SQL query to find the maximum order (purchase) amount by each customer. The customer ID should be in the range 3002 and 3007(Begin and end values are included.). Return customer id and maximum purchase amount. 
SELECT customer_id, MAX(purch_amt) AS Maximum_Purchase_Amount from orders WHERE customer_id BETWEEN 3002 AND 3007 GROUP BY customer_id;

-- 12. write a SQL query to count all the orders generated on '2012-08-17'. Return number of orders.
SELECT COUNT(*) AS Orders_On_170812 from orders
WHERE ord_date = TO_DATE('2012-08-17', 'YYYY-MM-DD');

-- Creating table
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

-- Q13: Write a SQL query to count the number of customers.
SELECT COUNT(*) FROM customer;

-- Q14: Write a SQL query to find the number of customers who got at least a gradation for his/her activity.
SELECT COUNT(*) FROM customer WHERE grade IS NOT NULL;

-- Q15: Write a SQL query to find the highest grade of the customers for each of the city. Return city, maximum grade.
SELECT city, MAX(grade) AS max_grade FROM customer GROUP BY city;

-- Creating table
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

-- Q16: Write a SQL query to count the number of salespeople who belong to a city. Return number of salespeople.
SELECT COUNT(*) FROM salesman WHERE city IS NOT NULL;

-- Creating table
CREATE TABLE item_mast (
    pro_id    INT,
    pro_name  VARCHAR(50),
    pro_price DECIMAL(10, 2),
    pro_com   INT
);

-- Insert data into item_mast table
INSERT INTO item_mast VALUES (101, 'Mother Board', 320.0, 15);
INSERT INTO item_mast VALUES (102, 'Key Board', 450, 16);
INSERT INTO item_mast VALUES (103, 'ZIP drive', 250, 14);
INSERT INTO item_mast VALUES (104, 'Speaker', 550, 16);
INSERT INTO item_mast VALUES (105, 'Monitor', 5000, 11);
INSERT INTO item_mast VALUES (106, 'DVD drive', 900, 12);
INSERT INTO item_mast VALUES (107, 'CD drive', 800, 12);
INSERT INTO item_mast VALUES (108, 'Printer', 2600, 13);
INSERT INTO item_mast VALUES (109, 'Refill cartridge', 350, 13);
INSERT INTO item_mast VALUES (110, 'Mouse', 250, 12);

-- Q17: Write a SQL query to count the number of products where product price is higher than or equal to 350. 
-- Return number of products.
SELECT COUNT(*) FROM item_mast WHERE pro_price >= 350;

-- Consider a table named Employee( Eid, Name, Dept, Salary, DOJ). Solve the following queries

-- Q18: Display the latest date on which an employee had joined.
SELECT MAX(DOJ) FROM Employee;

-- Q19: Display the 1st date on which an employee had joined.
SELECT MIN(DOJ) FROM Employee;

-- Q20: List out how many numbers of departments are there.
SELECT COUNT(DISTINCT Dept) FROM Employee;

-- Q21: Display how many numbers of employees are there in MCA Department.
SELECT COUNT(*) FROM Employee WHERE Dept = 'MCA';

-- Q22: Display department-wise maximum average salary.
SELECT Dept, MAX(Salary) FROM Employee GROUP BY Dept;

-- Q23: Display the total number of employees in the organization.
SELECT COUNT(*) FROM Employee;

-- Q24: Display department-wise the numbers of employees working.
SELECT Dept, COUNT(*) FROM Employee GROUP BY Dept;
