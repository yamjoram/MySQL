CREATE TABLE Customers ( 
CustomerID INT PRIMARY KEY, 
CustomerName VARCHAR(100), 
Age INT
);

INSERT INTO Customers VALUES 
(1, 'John Doe', 30),
(2, 'Alice Smith', 65),
(3, 'Bob Brown', 45),
(4, 'Charlie Davis', 25), 
(5, 'Eve Harris', 55),
(6, 'Frank Black', 40), 
(7, 'Grace White', 20), 
(8, 'Helen Green', 33), 
(9, 'Igor King', 60), 
(10, 'Jackie Lewis', 28),
(11, 'Kevin Moore', 50), 
(12, 'Liam Wilson', 60), 
(13, 'Mona Clark', 35), 
(14, 'Nancy Adams', 70), 
(15, 'Oscar Scott', 41);

Questions : This question asks you to categorize customers based on their Age into three groups: 'Young' for ages less than 35, 
            'Middle-aged' for ages between 35 and 55, and 'Senior' for ages 56 and above. 

select CustomerName, Age,
        case when Age < 35 then "Young"
        when Age between 35 and 55 then "Middle-Aged"
        else "Senior" end as Age_category
from Customers;
