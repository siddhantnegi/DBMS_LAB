-- 1.1 Create the table Client_Master
CREATE TABLE Client_Master (  
    Client_No VARCHAR2(6),  
    Name VARCHAR2(20),  
    Address1 VARCHAR2(30),  
    Address2 VARCHAR2(30),  
    City VARCHAR2(15),  
    State VARCHAR2(15),  
    Pincode NUMBER(6),  
    Bal_Due NUMBER(10,2)  
);

-- 1.2 Create the table Product_Master
CREATE TABLE Product_Master ( 
    Product_NO VARCHAR2(6), 
    Description VARCHAR2(20), 
    Profit_percentage NUMBER(6), 
    Unit_Measure VARCHAR2(10), 
    Qty_On_Hand NUMBER(6), 
    Reorder_Lvl NUMBER(6), 
    Sell_Price NUMBER(7,2), 
    Cost_Price NUMBER(7,2) 
);

-- 2. Add a new column DOB to table Client_Master.
ALTER TABLE Client_Master ADD DOB DATE

-- 3. Change the data type of Client_No to number.
ALTER TABLE Client_Master MODIFY Client_No NUMBER;

-- 4. Drop the newly added column DOB from Client_Master.
ALTER TABLE Client_Master DROP COLUMN DOB;

-- 5. Rename the column Sell_Price in Product_Master table to SellPrice.
ALTER TABLE Product_Master RENAME COLUMN Sell_Price TO SellPrice;

-- 6. Rename the table Product_Master to ProductMaster.
ALTER TABLE Product_Master RENAME TO ProductMaster;

-- 7. Delete both the tables. 
DROP TABLE ProductMaster;
DROP TABLE Client_Master;
