CREATE TABLE CryptoTransactions ( 
TransactionID INT PRIMARY KEY, 
TransactionDate DATE, 
TransactionAmount DECIMAL(10, 2),
TransactionType VARCHAR(50)
);


INSERT INTO CryptoTransactions VALUES
(1, '2024-01-10', 1000, 'Deposit'),
(2, '2024-02-05', 500, 'Withdrawal'), 
(3, '2024-02-10', 1500, 'Deposit'), 
(4, '2024-02-15', 300, 'Deposit'),
(5, '2024-02-20', 100, 'Withdrawal'), 
(6, '2024-02-25', 800, 'Deposit'),
(7, '2024-03-01', 1200, 'Withdrawal'),
(8, '2024-03-05', 500, 'Deposit'),
(9, '2024-03-10', 200, 'Withdrawal'),
(10, '2024-03-15', 1500, 'Deposit'), 
(11, '2024-03-20', 900, 'Withdrawal'), 
(12, '2024-03-25', 1300, 'Deposit'), 
(13, '2024-03-30', 700, 'Withdrawal'), 
(14, '2024-04-01', 2500, 'Deposit'),
(15, '2024-04-05', 1000, 'Withdrawal');

Questions : This question asks you to categorize transactions as either 'High Value' or 'Standard Value' based on the TransactionAmount. 
            If the transaction amount is greater than 1000, mark it as 'High Value'; otherwise, it should be 'Standard Value'.

select TransactionID, TransactionDate, TransactionType, TransactionAmount,
        case when TransactionAmount > 1000 then "High Value"
          else "Standard Value" end as Transaction_Status
from CryptoTransactions;
