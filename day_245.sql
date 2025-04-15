

Questions : Write an SQL query to fix the number format in the Amount column of the Transactions table, which is stored as text. The column contains numeric values with
            commas as thousand separators (e.g., '1,000', '1,500.50'). Remove the commas and standardize the format to store the number as a plain text value (e.g., '1000', '1500.50').


CREATE TABLE Transactions (
TransactionID INT,
    Amount TEXT
);



INSERT INTO Transactions (TransactionID, Amount) VALUES
(1, '1,000'), 
(2, '2,500.75'), 
(3, '3,000'),
(4, '1,200.50'),
(5, '4,500');


update Transactions
set Amount = replace(Amount, ",", "");
