SELECT * FROM us_regional_sales_data;
  
SELECT COUNT(DISTINCT ï»¿OrderNumber) AS distinct_order_count
FROM us_regional_sales_data;
ALTER TABLE us_regional_sales_data
ADD USD_rate DECIMAL(10,2);
SELECT 
    `Sales Channel`,
    SUM(Unit_priceinINR) AS TotalUnitpriceinINR
FROM us_regional_sales_data
GROUP BY `Sales Channel`;
UPDATE us_regional_sales_data
SET USD_rate = 88.00;
ALTER TABLE us_regional_sales_data
DROP COLUMN Unit_priceinINR;
ALTER TABLE us_regional_sales_data
ADD Unit_priceinINR DECIMAL(18,2);
UPDATE us_regional_sales_data
SET Unit_priceinINR = `Unit Price(in USD)` * USD_rate;
ALTER TABLE us_regional_sales_data
ADD Unit_costinINR DECIMAL(18,2);
UPDATE us_regional_sales_data
SET Unit_priceinINR = `Unit Cost(In USD)` * USD_rate;
SELECT *
FROM us_regional_sales_data
WHERE YEAR(OrderDate) = 2018
  AND MONTH(OrderDate) = 5;
SELECT COUNT(DISTINCT WarehouseCode) AS distinct_warehouse_count
FROM us_regional_sales_data;
SELECT 
    WarehouseCode,
    count(WarehouseCode) AS No_of_warehouses
FROM us_regional_sales_data
GROUP BY `WarehouseCode`;
SELECT * FROM us_regional_sales_data LIMIT 7992;






