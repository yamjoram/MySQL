CREATE TABLE SalesTransactions ( 
EmployeeID INT,
TransactionAmount DECIMAL(10, 2) );

INSERT INTO SalesTransactions VALUES
(1, 15000),
(1, 35000),
(1, 40000),
(2, 5000),
(2, 30000),
(2, 20000),
(3, 10000),
(3, 25000),
(3, 4000),
(4, 60000);

Questions : Given a table of sales transactions, categorize sales performance based on the total amount of sales for each employee. If an employee’s total sales exceed $100,000, 
            classify them as 'Top Performer'. If the total sales are between $50,000 and $100,000, classify them as 'Average Performer'.
            If the total sales are below $50,000, classify them as 'Low Performer'.

select EmployeeID, sum(TransactionAmount) as total_amount,
      case when sum(TransactionAmount) > 100000 then "High Performer"
            when sum(TransactionAmount) between  50000 and 100000  then "Average Performer"
            else "Low Performer" end as Performance_Category
from SalesTransactions
group by 1;
