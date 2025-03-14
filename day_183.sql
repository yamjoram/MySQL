CREATE TABLE CustomerPurchases (
CustomerID INT , 
PurchaseID INT, 
PurchaseDate DATE
);

INSERT INTO CustomerPurchases (CustomerID, PurchaseID, PurchaseDate) VALUES
(1, 101, '2023-03-15'),
(1, 102, '2023-08-20'),
(1, 103, '2024-01-10'), 
(2, 104, '2022-02-05'), 
(2, 105, '2023-07-15'), 
(2, 106, '2024-04-22'),
(3, 107, '2023-06-11'),
(3, 108, '2023-09-25');

Questions: Calculate the difference in months between the first and last purchase dates for each customer.

select CustomerID,
        min(PurchaseDate), max(PurchaseDate),
       timestampdiff(month, min(PurchaseDate), max(PurchaseDate)) as diff 
from CustomerPurchases
group by 1;
