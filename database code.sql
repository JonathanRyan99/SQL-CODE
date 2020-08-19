-- databases Jonathan Ryan

DROP DATABASE IF EXISTS LCS;
DROP USER IF EXISTS 'user@localhost';
CREATE DATABASE LCS;
-- delete the database if it exsists then create the database

-- creating the different tables
-- primary keys are delcared at the end of each table

CREATE TABLE LCS.Customer ( 
Cust_Email VARCHAR(50) NOT NULL , 
Cust_Fname VARCHAR(20) NOT NULL , 
Cust_Lname VARCHAR(20) NOT NULL , 
Cust_Age DATE NOT NULL, 
Cust_PhoneNo BIGINT(10) NOT NULL , 
Cust_HouseNo INT(10) NOT NULL , 
Cust_Street VARCHAR(50) NOT NULL , 
Cust_City VARCHAR(20) NOT NULL , 
Cust_PostCode VARCHAR(6) NOT NULL , 
Cust_BankDetails BIGINT(20) NOT NULL , 
Cust_CardNo BIGINT(16)NOT NULL , 
Cust_ExpiryDate INT(4) NOT NULL , 
Cust_CVV INT(3) NOT NULL , 
Cust_BillingAddress VARCHAR(30) NOT NULL , 
PRIMARY KEY (Cust_Email));

CREATE TABLE LCS.Staff ( 
Staff_Email VARCHAR(50) NOT NULL , 
Staff_Fname VARCHAR(20) NOT NULL , 
Staff_Lname VARCHAR(20) NOT NULL , 
Staff_PhoneNo BIGINT(10) NOT NULL,
PRIMARY KEY (Staff_Email));

CREATE TABLE LCS.Supplier ( 
Supp_Name VARCHAR(20) NOT NULL , 
Supp_Email VARCHAR(50) NOT NULL , 
Supp_PhoneNo BIGINT(10) NOT NULL ,
Supp_HouseNo INT(10) NOT NULL , 
Supp_Street VARCHAR(50) NOT NULL , 
Supp_City VARCHAR(20) NOT NULL , 
Supp_PostCode VARCHAR(6) NOT NULL,
PRIMARY KEY (Supp_Email));

CREATE TABLE LCS.Service ( 
Serv_Name VARCHAR(20) NOT NULL , 
Serv_Description TEXT(50) NOT NULL , 
Serv_Cost DOUBLE NOT NULL,
Stock_name VARCHAR(20) NOT NULL,
PRIMARY KEY (Serv_Name));

CREATE TABLE lcs.Customer_order( 
CustOrder_id INT(11) NOT NULL AUTO_INCREMENT,
Cust_Email VARCHAR(50) NOT NULL ,
Cust_address VARCHAR(50) NOT NULL , 
Date_Time DATETIME NOT NULL , 
Serv_name VARCHAR(20) NOT NULL , -- gets dropped
Serv_price DOUBLE NOT NULL , -- gets dropped
Total_price DOUBLE NOT NULL,
Staff_Email VARCHAR(50) NOT NULL, 
PRIMARY KEY (CustOrder_id));

CREATE TABLE lcs.stock(
Stock_name VARCHAR(20) NOT NULL,
Stock_quantity INT(10) NOT NULL,
PRIMARY KEY (Stock_name));


CREATE TABLE lcs.Purchase_orders(
pur_id INT(11) NOT NULL AUTO_INCREMENT,
stock_name VARCHAR(20) NOT NULL,
Pur_price INT NOT NULL,
Supp_Email VARCHAR(50) NOT NULL,
PRIMARY KEY (pur_id));

-- adding info to the new tables
-- the following work by just inserting the data 

INSERT INTO lcs.customer 
VALUES('ruben.stone46@example.com',
 'Ruben', 'Stone', '1983/4/3','9323519452','1','Main Rd',' Heople',
 'GF543E','9870345665','1254763589','1322','765','1 Main Rd Heople');
INSERT INTO lcs.customer
VALUES('sophia.rose74@example.com', 'sophia', 'rose', '1973/7/4', '8467423833', '2','Mcgowen', 'Ward',
'WR779D', '6665777789', '7777666654', '2204', '876', '2 Mcgowen Ward ');
INSERT INTO lcs.customer
VALUES('hectorpalmer57@example.com', 'Hector', 'Palmer', '1974/10/6', '1966594486', '8','Shelley St', 'Narcardo', 
'NA3432', '8769346790', '7666853453', '2210', '563', '8 Shelley St Narcardo');
INSERT INTO lcs.customer
VALUES('almadavis57@example.com', 'Alma', 'Davis', '1982/12/03', '1029443001', '7','Daisy St', 
'Carlton', 'FX8315', '8723124561', '9823458921', '2309', '443', '7 Daisy St');
INSERT INTO lcs.customer
VALUES('kayford81@example.com', 'Kay', 'Ford', '1994/5/12', '3137226005', '2', 'Abby Park st', 
'Gockinish', 'GC1352', '7465999034', '2747189344', '2211', '990', '2 Abby Park St Gockinish');
INSERT INTO lcs.customer
VALUES('franceshale57@example.com', 'Frances', 'Hale', '1997/11/1', '7175978077', '3','Hill Rd', 
'Mountin', 'MT8782', '8909786866', '5566784576', '2205', '333', '3 Hill Rd Mountin');


INSERT INTO lcs.staff VALUES ('briannawest64@example.com', 'Brianna', 'West', '3051572108');
INSERT INTO lcs.staff VALUES ('julianharrison20@example.com', 'Julian', 'Harrison', '2679386947');
INSERT INTO lcs.staff VALUES ('heathergreen80@example.com', 'Heather', 'Green', '9125016642');


INSERT INTO lcs.supplier VALUES ('ICTWholeSalers','ICTWholeSalers@example.com', '8287719808', '43',
'Nowlin Rd', 'Coowlin', 'CX4056');
INSERT INTO lcs.supplier VALUES ('HiFiCenter','HiFiCenter@example.com', '4853587255', '56',
'Valwood st', 'Pwky', 'PV4287');


INSERT INTO lcs.service VALUES('Software_upgrade','upgrading the users softwware and or os','10.00','software');
INSERT INTO lcs.service VALUES ('hardware upgrade', 'upgrade the users hardware to the next version', '25.00','spareParts');
INSERT INTO lcs.service VALUES ('hardware repair', 'fix faulty hardware in the computer', '50.00','spareParts');

-- customer order and Purchase_orders both contain auto_incremeting IDs which means the table names have to be specified
INSERT INTO lcs.customer_order (`CustOrder_id`, `Cust_Email`, `Cust_address`, `Date_Time`, `Serv_name`, `Serv_price`, `Total_price`, `Staff_Email`) 
VALUES (NULL,'hectorpalmer57@example.com','8 Shelley St Narcardo', '2018-12-05 11:34:00', 
 'Software_upgrade','10.00', '10.00','briannawest64@example.com');
INSERT INTO lcs.customer_order (`CustOrder_id`, `Cust_Email`, `Cust_address`, `Date_Time`, `Serv_name`, `Serv_price`, `Total_price`, `Staff_Email`) 
VALUES (NULL,'sophia.rose74@example.com', '2 Mcgowen Ward', '2018-12-21 00:13:27', 
'hardware upgrade','25.00','25.00','heathergreen80@example.com');


INSERT INTO lcs.stock VALUES ('spareParts','20');
INSERT INTO lcs.stock VALUES ('SoftWare','20');


INSERT lcs.Purchase_orders(`pur_id`, `stock_name`, `Pur_price`, `Supp_Email`) 
VALUES (NULL, 'spareParts', '1000', 'ICTWholeSalers@example.com');
INSERT lcs.Purchase_orders(`pur_id`, `stock_name`, `Pur_price`, `Supp_Email`) 
VALUES (NULL, 'software', '2000', 'HiFiCenter@example.com');
-- end of inserts

--  Alters for FK implementation

ALTER TABLE lcs.Customer_order -- selects table to add forigen key to
ADD CONSTRAINT FK_Customer_Email -- names the relation
FOREIGN KEY (Cust_Email) REFERENCES lcs.Customer (Cust_Email) -- sets customer_Email in Customer_order, to link to the email in Customer table
ON UPDATE CASCADE ON DELETE CASCADE; -- when parent table is updated/deleted the child table matching rows are also affected

ALTER TABLE lcs.Customer_order 
ADD CONSTRAINT FK_Staff_Email
FOREIGN KEY (Staff_Email) REFERENCES lcs.Staff (Staff_Email)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE lcs.Service 
ADD CONSTRAINT FK_Stock_name
FOREIGN KEY (Stock_name) REFERENCES lcs.Stock (Stock_name)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE lcs.Purchase_orders 
ADD CONSTRAINT FK_PurStock_name
FOREIGN KEY (Stock_name) REFERENCES lcs.Stock (Stock_name)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE lcs.Purchase_orders 
ADD CONSTRAINT FK_PurSupp_Email
FOREIGN KEY (Supp_Email) REFERENCES lcs.Supplier (Supp_Email)
ON UPDATE CASCADE ON DELETE CASCADE;

-- drop ser_price , ser_name (they're not needed in customer order table)

ALTER TABLE lcs.Customer_order
DROP COLUMN Serv_name;

ALTER TABLE lcs.Customer_order
DROP COLUMN Serv_price;

-- update set and defult----
UPDATE lcs.stock
SET Stock_quantity = 50
WHERE Stock_name = 'SoftWare';


DELETE FROM lcs.Customer
WHERE Cust_Fname= 'Kay';

-- creating copies -------------------------------

CREATE TABLE lcs.copy_of_customer LIKE lcs.customer;
INSERT  lcs.copy_of_customer SELECT * FROM lcs.customer;

CREATE TABLE lcs.copy_of_customer_order LIKE lcs.customer_order;
INSERT  lcs.copy_of_customer_order SELECT * FROM lcs.customer_order;

CREATE TABLE lcs.copy_of_purchase_orders LIKE lcs.purchase_orders;
INSERT  lcs.copy_of_purchase_orders SELECT * FROM lcs.purchase_orders;

CREATE TABLE lcs.copy_of_service LIKE lcs.service;
INSERT  lcs.copy_of_service SELECT * FROM lcs.service;

CREATE TABLE lcs.copy_of_staff LIKE lcs.staff;
INSERT  lcs.copy_of_staff SELECT * FROM lcs.staff;

CREATE TABLE lcs.copy_of_stock LIKE lcs.stock;
INSERT  lcs.copy_of_stock SELECT * FROM lcs.stock;

CREATE TABLE lcs.copy_of_supplier LIKE lcs.supplier;
INSERT  lcs.copy_of_supplier SELECT * FROM lcs.supplier;

-- end of creating copies ----------------------------

-- creating user-----
CREATE USER IF NOT EXISTS 'user'@'localhost' IDENTIFIED BY 'BEPIS'; -- creates user with password bepis
GRANT SELECT ON LCS.* TO 'user'@'localhost';
-- allows user to only select any tables inside the lcs database (read only)



-- inner join ------------

SELECT c.Cust_Email ,c.Cust_Fname, c.Cust_Lname, co.Total_price, co.Staff_Email -- selections of what i want from both tables
FROM lcs.Customer_order co -- creates name for customer_order table (less writing)
INNER JOIN lcs.customer c on c.Cust_Email= co.Cust_Email;
-- last line here creates another name for the customer table, 
-- this inner join is joined by the cust_Email, and presents infomration from customer table and customer_order tables


-- left join
SELECT s.Staff_Email, s.Staff_Fname, CustOrder_id, Cust_Email 
FROM lcs.Staff s
LEFT JOIN Customer_order Co ON Co.Staff_Email = s.Staff_Email; 
-- shows null values on the left 


-- right join 
SELECT s.Staff_Email, s.Staff_Fname, CustOrder_id, Cust_Email 
FROM lcs.Staff s
RIGHT JOIN Customer_order Co ON Co.Staff_Email = s.Staff_Email;
-- shows null values on the right

-- uninion

SELECT s.Staff_Email, s.Staff_Fname, CustOrder_id, Cust_Email 
FROM lcs.Staff s
LEFT JOIN Customer_order Co ON Co.Staff_Email = s.Staff_Email
UNION DISTINCT
SELECT s.Staff_Email, s.Staff_Fname, CustOrder_id, Cust_Email 
FROM lcs.Staff s
RIGHT JOIN Customer_order Co ON Co.Staff_Email = s.Staff_Email;
-- shows null values on both sides of the union















