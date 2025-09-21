SELECT * FROM Train_database;
SELECT * FROM Train_database
WHERE `Row ID` = 50;
ALTER TABLE Train_database
RENAME TO Train_D1;
SELECT * FROM Train_D1;
SELECT COUNT(`Order ID`) AS total_orders
FROM Train_D1;
SELECT SUM(`Price per unit`) AS Total_Sales
FROM Train_D1;
SELECT MIN(Sales) AS Min_Sale
FROM Train_D1;
SELECT MAX(Sales) AS Max_Sale
FROM Train_D1;
ALTER TABLE Train_D1
RENAME COLUMN Sales TO `Price per unit`;
SELECT * FROM Train_D1;
ALTER TABLE Train_D1
ADD COLUMN Quantity INT;
SELECT *
FROM Train_D1;
UPDATE Train_D1
SET Quantity = 5
WHERE `Row ID` = 1;
SELECT *
FROM Train_D1;
SHOW VARIABLES LIKE 'secure_file_priv';
SELECT * FROM Train_D1;
SELECT Region, SUM(`Total sales`) AS Total_Salesperregion
FROM Train_D1
GROUP BY Region
ORDER BY Total_Salesperregion DESC;
DELETE FROM Train_D1
WHERE `Row ID` BETWEEN 100 AND 135;
SELECT * FROM Train_D1;
SELECT COUNT(*) AS Number_of_Orders
FROM Train_D1
WHERE `Order Date` BETWEEN '2017-07-10' AND '2017-08-10';
SELECT * FROM Train_D1;
SELECT COUNT(*) AS Number_of_Ordersin2017
FROM Train_D1
WHERE YEAR(`Order Date`) = 2017;
SELECT * FROM Train_D1;



