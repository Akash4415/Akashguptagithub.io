ALTER TABLE `electronic_sales dataset` RENAME TO `electronic_salesdataset`;



#Fixing errors err-diagram


SELECT DISTINCT Keyword_City
FROM electronic_salesdataset
WHERE Keyword_City NOT IN (SELECT Keyword_City FROM keyword_city);

DELETE FROM electronic_salesdataset
WHERE Keyword_City NOT IN (SELECT Keyword_City FROM keyword_city);

ALTER TABLE electronic_salesdataset
ADD CONSTRAINT Keyword_City
FOREIGN KEY (Keyword_City) REFERENCES keyword_city (Keyword_City);

SELECT DISTINCT Keyword_Product
FROM electronic_salesdataset
WHERE Keyword_Product NOT IN (
    SELECT Keyword_Product FROM keyword_product
);

DELETE FROM electronic_salesdataset
WHERE Keyword_Product NOT IN (
    SELECT Keyword_Product FROM keyword_product
);

ALTER TABLE electronic_salesdataset
ADD CONSTRAINT Keyword_Product
  FOREIGN KEY (Keyword_Product)
  REFERENCES keyword_product (Keyword_Product);
  
SELECT DISTINCT Keyword_Category
FROM electronic_salesdataset
WHERE Keyword_Category NOT IN (
    SELECT Keyword_Category FROM keyword_category
);

DELETE FROM electronic_salesdataset
WHERE Keyword_Category NOT IN (
    SELECT Keyword_Category FROM keyword_category
);

ALTER TABLE electronic_salesdataset
ADD CONSTRAINT Keyword_Category
  FOREIGN KEY (Keyword_Category)
  REFERENCES keyword_category (Keyword_Category);
