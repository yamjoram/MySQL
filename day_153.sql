


Questions : Write an SQL query to report the number of bank accounts in each salary category. The salary categories are:
            • "Low Salary": All salaries strictly less than $20,000.
            • "Average Salary": All salaries in the inclusive range [$20,000, $50,000]. 
            • "High Salary": All salaries strictly greater than $50,000.
            The result table must contain all three categories. If there are no accounts in a category, report 0. Return the result table in any order.



CREATE TABLE Accounts (
account_id INT PRIMARY KEY,
income INT );

INSERT INTO Accounts (account_id, income) VALUES
    (3, 108939),
    (2, 12747),
    (8, 87709),
    (6, 91796);
    
    
select "Low Salary" as category,
    count(*) as account_counts
from Accounts
where income < 20000
union all 
select "Average Salary" as category,
count(*) as account_counts
from Accounts
where income between 20000 and 50000
union all 
select "High Salary" as category,
count(*) as account_counts
from Accounts
where income > 50000;
