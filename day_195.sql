CREATE TABLE Products ( 
ProductID INT,
ProductName VARCHAR(100),
Price DECIMAL(10, 2) );

INSERT INTO Products VALUES 
(1, 'Smartphone', 150),
(2, 'Laptop', 999), 
(3, 'Headphones', 40),
(4, 'Tablet', 250), 
(5, 'Charger', 25), 
(6, 'Smartwatch', 75), 
(7, 'Camera', 200), 
(8, 'Mouse', 20),
(9, 'Keyboard', 80);

Questions : Given a table of product prices, identify the pricing strategy for each product. If the price is greater than $100, categorize it as 'Premium'.
            If the price is between $50 and $100, categorize it as 'Standard'. If the price is below $50, categorize it as 'Discount'.

select *,
      case when Price > 100 then "Premium"
      when Price between 50 and 100 then "Standard"
      else "Discounts" end as price_category
from Products;
