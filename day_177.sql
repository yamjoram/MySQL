CREATE TABLE Transactions (
TransactionID INT PRIMARY KEY, 
TransactionDate DATE,
Amount DECIMAL(10, 2)
);

INSERT INTO Transactions (
TransactionID, 
TransactionDate, 
Amount) VALUES
(1, '2023-11-20', 250.50), 
(2, '2022-05-15', 180.75),
(3, '2024-01-10', 540.60);

Questions : Extract the year from the TransactionDate.

select extract(year from TransactionDate) as year_
from Transactions;
