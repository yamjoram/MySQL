CREATE TABLE Employees (
EmployeeID INT PRIMARY KEY, 
EmployeeName VARCHAR(100), 
Salary DECIMAL(10, 2)
);


INSERT INTO Employees VALUES 
(1, 'John Doe', 120000),
(2, 'Alice Smith', 90000),
(3, 'Bob Brown', 60000),
(4, 'Charlie Davis', 135000), 
(5, 'Eve Harris', 75000),
(6, 'Frank Black', 110000), 
(7, 'Grace White', 85000), 
(8, 'Helen Green', 95000), 
(9, 'Igor King', 65000),
(10, 'Jackie Lewis', 140000),
(11, 'Kevin Moore', 115000), 
(12, 'Liam Wilson', 80000), 
(13, 'Mona Clark', 90000), 
(14, 'Nancy Adams', 70000), 
(15, 'Oscar Scott', 105000);

Questions : This question asks you to categorize employees into salary grades: 'Grade A' for more tahn 100000, 'Grade B' between 70000 and 100000, and 'Grade C' for less than 70000, based on their salary.

select EmployeeName, Salary,
      case when Salary < 70000 then "Grade C"
           when Salary between 70000 and 100000 then "Grade B"
           else "Grade A" end as Grade
from Employees;
