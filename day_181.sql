

CREATE TABLE Transactions (
TransactionID INT PRIMARY KEY, 
TransactionDate DATE,
Amount DECIMAL(10, 2)
);
-- Datasets
INSERT INTO Transactions (TransactionID, TransactionDate, Amount) VALUES
(1, '2023-11-20', 250.50), 
(2, '2022-05-15', 180.75), 
(3, '2024-01-10', 540.60),
(4, '2023-11-21', 320.40),
(5, '2023-11-22', 150.20), 
(6, '2023-11-20', 430.30),
(7, '2023-11-23', 210.10), 
(8, '2023-11-24', 300.00), 
(9, '2023-11-25', 150.00),
(10, '2023-11-26', 500.00), 
(11, '2023-11-27', 410.25), 
(12, '2023-11-28', 100.40),
(13, '2023-11-29', 750.90), 
(14, '2023-11-30', 600.75), 
(15, '2023-12-01', 230.15), 
(16, '2023-12-02', 185.20), 
(17, '2023-12-03', 420.60), 
(18, '2023-12-04', 520.45), 
(19, '2023-12-05', 310.10), 
(20, '2023-12-06', 450.25), 
(21, '2023-12-07', 650.80),
(22, '2023-12-08', 370.50), 
(23, '2023-12-09', 330.30), 
(24, '2023-12-10', 490.40), 
(25, '2023-12-11', 210.75), 
(26, '2023-12-12', 320.10);

Questions : You need to extract the day of the week from the TransactionDate and calculate the total sales for each day using the Amount column.

select dayofweek(TransactionDate) as day, sum(Amount) as total_sale
from Transactions
group by 1
order by 2 desc;
