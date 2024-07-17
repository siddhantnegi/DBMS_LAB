-- Create the table
CREATE TABLE PRODUCT_MASTER (
    PRODUCTNO VARCHAR2(6),
    DESCRIPTION VARCHAR2(15),
    PROFITPERCENT NUMBER(4,2),
    UNITMEASURE VARCHAR2(10),
    QTYONHAND NUMBER(8),
    REORDERLVL NUMBER(8,2),
    SELLPRICE NUMBER(8,2),
    COSTPRICE NUMBER(8,2)
);

-- Insert data
INSERT INTO PRODUCT_MASTER VALUES ('P00001', '1.44floppies', 5, 'Piece', 200, 50, 350, 250);
INSERT INTO PRODUCT_MASTER VALUES ('P03453', 'Monitors', 6, 'Piece', 150, 50, 500, 350);
INSERT INTO PRODUCT_MASTER VALUES ('P06734', 'Mouse', 5, 'Piece', 100, 20, 600, 450);
INSERT INTO PRODUCT_MASTER VALUES ('P07865', '1.22floppies', 5, 'Piece', 100, 20, 750, 500);
INSERT INTO PRODUCT_MASTER VALUES ('P07868', 'Keyboards', 2, 'Piece', 150, 50, 850, 550);
INSERT INTO PRODUCT_MASTER VALUES ('P07885', 'CDDrive', 2.5, 'Piece', 80, 30, 700, 450);
INSERT INTO PRODUCT_MASTER VALUES ('P07965', '540 HDD', 4, 'Piece', 100, 40, 350, 250);
INSERT INTO PRODUCT_MASTER VALUES ('P07975', '1.44Drive', 5, 'Piece', 70, 30, 300, 175);
INSERT INTO PRODUCT_MASTER VALUES ('P08865', '1.22Drive', 5, 'Piece', 75, 30, 450, 300);

-- Q3 List the various products available from the product_master table. 
SELECT description FROM PRODUCT_MASTER;

-- Q6 Find the products with description as ‘1.44 Drive’ and ‘1.22 Drive’. 
SELECT * FROM PRODUCT_MASTER
WHERE description in ('1.44Drive', '1.22Drive');

-- Q7 Find all the products whose sell price is greater than 5000. 
SELECT * FROM PRODUCT_MASTER
WHERE SELLPRICE > 5000;

-- Q9 Find the product whose selling price is greater than 2000 and less than or equal to 5000.
SELECT * FROM PRODUCT_MASTER
WHERE SELLPRICE > 2000 AND SELLPRICE <= 5000;

-- Q11 Change the selling price of ‘1.44 floppy drive’ to Rs.1150.00
UPDATE PRODUCT_MASTER
SET SELLPRICE = 1150.00
WHERE DESCRIPTION = '1.22floppies';

-- Q13 Find the products whose selling price is more than 1500 and also find the new selling price as original selling price*15
SELECT 
    ProductNo,
    SellPrice,
    SellPrice * 15 AS New_Sell_Price
FROM 
    PRODUCT_MASTER
WHERE 
    SellPrice > 1500;

-- Q16 List the products in sorted order of their description. 
SELECT *
FROM PRODUCT_MASTER
ORDER BY DESCRIPTION; -- ASCENDING BY DEFAULT

-- Q17 Count the total number of product. 
SELECT COUNT(*)
FROM PRODUCT_MASTER;

-- Q18 Calculate the average price of all the products
-- For SellPrice
SELECT AVG(SellPrice) AS Avg_Sell_Price
FROM PRODUCT_MASTER;
-- For CostPrice
SELECT AVG(CostPrice) AS Avg_Cost_Price
FROM PRODUCT_MASTER;

-- Q19 Calculate the minimum price of products.
-- For SellPrice
SELECT MIN(SELLPRICE) FROM PRODUCT_MASTER;
-- For CostPrice
SELECT MIN(COSTPRICE) FROM PRODUCT_MASTER;

-- Q20 Determine the maximum and minimum prices. Rename the tittle as ‘max_price’ and min_price respectively.
-- For SellPrice
SELECT MAX(SELLPRICE) AS max_price, MIN(SELLPRICE) AS min_price FROM PRODUCT_MASTER;
-- For CostPrice
SELECT MAX(COSTPRICE) AS max_price, MIN(COSTPRICE) AS min_price FROM PRODUCT_MASTER;

-- Q21 Count the number of products having price greater than or equal to 1500
-- For SellPrice
SELECT COUNT(*)
FROM PRODUCT_MASTER
WHERE SELLPRICE >= 1500;
-- For CostPrice
SELECT COUNT(*)
FROM PRODUCT_MASTER
WHERE CostPrice >= 1500;

-- Q22 List the products according to ascending order of their selling price.
SELECT *
FROM PRODUCT_MASTER
ORDER BY SELLPRICE;

-- Q23 List the products according to descending order of their selling price.
SELECT *
FROM PRODUCT_MASTER
ORDER BY SELLPRICE DESC;

-- Queries 1,2,4,5,8,10,12,14,15 have been left since records of these queries belong to Assignment 2.
