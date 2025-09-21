SELECT * FROM car_sales_data;
DELETE FROM car_sales_data
WHERE Date IS NULL;
DELETE FROM car_sales_data
WHERE Salesperson IS NULL;
DELETE FROM car_sales_data
WHERE `Customer Name` IS NULL;
DELETE FROM car_sales_data
WHERE `Car Make` IS NULL;
DELETE FROM car_sales_data
WHERE `Car Model` IS NULL;
DELETE FROM car_sales_data
WHERE `Car Year` IS NULL;
DELETE FROM car_sales_data
WHERE `Sale Price` IS NULL;
DELETE FROM car_sales_data
WHERE `Commission Rate` IS NULL;
DELETE FROM car_sales_data
WHERE `Commission Earned` IS NULL;
ALTER TABLE car_sales_data
ADD price_in_INR DECIMAL(10,2);  -- DECIMAL(10,2) allows two decimal places

-- Step 2: Update all rows to have the value 88.09
UPDATE car_sales_data
SET price_in_INR = 88.09;
ALTER TABLE car_sales_data
RENAME COLUMN `Sale Price` TO Sale_PriceUSD;
UPDATE car_sales_data
SET price_in_INR = 88.09;
SELECT * FROM car_sales_data;
SELECT 
    Sale_PriceUSD,
    price_in_INR,
    (Sale_PriceUSD * price_in_INR) AS Total_Price_INR
FROM car_sales_data;
SELECT * FROM car_sales_data;
ALTER TABLE car_sales_data
RENAME COLUMN `price_in_INR` TO INR_RateToday;
ALTER TABLE car_sales_data
ADD Total_PriceinINR DECIMAL(18,2);

-- Step 2: Update the new column with the multiplied values
UPDATE car_sales_data
SET Total_PriceinINR = Sale_PriceUSD * INR_RateToday;
SELECT * FROM car_sales_data;
ALTER TABLE car_sales_data
ADD Commission_earnedinINR DECIMAL(18,2);
UPDATE car_sales_data
SET Commission_earnedinINR = `Commission Earned`*INR_RateToday;
SELECT * FROM car_sales_data;



