

Questions : Write an SQL query to find the bank accounts where the total income from deposits exceeds the max_income for two or more consecutive months. 
            The total income of an account in a month is the sum of all its 'Creditor' transactions during that month.



CREATE TABLE Accounts (
account_id INT PRIMARY KEY,
max_income INT );

CREATE TABLE Transactions ( 
transaction_id INT PRIMARY KEY, 
account_id INT,
type ENUM('Creditor', 'Debtor'), 
amount INT,
day DATETIME
);

INSERT INTO Accounts (account_id, max_income) VALUES
    (3, 21000),
    (4, 10400);
INSERT INTO Transactions (transaction_id, account_id, type, amount, day) VALUES
(2, 3, 'Creditor', 107100, '2021-06-02 11:38:14'), 
(4, 4, 'Creditor', 10400, '2021-06-20 12:39:18'), 
(11, 4, 'Debtor', 58800, '2021-07-23 12:41:55'), 
(1, 4, 'Creditor', 49300, '2021-05-03 16:11:04'), 
(15, 3, 'Debtor', 75500, '2021-05-23 14:40:20'), 
(10, 3, 'Creditor', 102100, '2021-06-15 10:37:16'), 
(14, 4, 'Creditor', 56300, '2021-07-21 12:12:25'), 
(19, 4, 'Debtor', 101100, '2021-05-09 15:21:49'), 
(8, 3, 'Creditor', 64900, '2021-07-26 15:09:56'),
(7, 3, 'Creditor', 90900, '2021-06-14 11:23:07');

select account_id, date_format(day, "%Y-%m") as month, sum(amount) as total_amount
from Transactions 
where type = "Creditor"
group by 1, 2
having sum(amount) > 
          (select max_income from Accounts where Accounts.account_id = Transactions.account_id);
