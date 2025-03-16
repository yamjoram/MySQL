CREATE TABLE CustomerPurchases ( 
CustomerID INT PRIMARY KEY, 
TotalSpent DECIMAL(10, 2)
);

INSERT INTO CustomerPurchases VALUES 
(1, 350.00),
(2, 1500.00),
(3, 75.00),
(4, 230.00),
(5, 1200.00),
(6, 450.00),
(7, 25.00),
(8, 890.00),
(9, 1020.00),
(10, 300.00),
(11, 150.00),
(12, 600.00),
(13, 750.00),
(14, 50.00),
(15, 10.00);

Questions : This question asks you to categorize customers into three spending categories: 'Low Spender' for below 100, 
            'Medium Spender' for between 100 and 500, and 'High Spender' for more than 500, based on the TotalSpent value. 
            Use a CASE statement to assign these categories.

select CustomerID, TotalSpent,
      case when TotalSpent < 100 then "Low Spender"
           when TotalSpent between 100 and 500 then "Medium Spender"
           else "High Spender" end as spender_category
from CustomerPurchases;
