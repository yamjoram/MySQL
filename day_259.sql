

Questions : Write a SQL query to find employees who have the highest salary in each of the departments.






CREATE TABLE Employee (
Id INT PRIMARY KEY, 
Name VARCHAR(100), 
Salary DECIMAL,
DepartmentId INT
);

CREATE TABLE Department (
Id INT PRIMARY KEY, 
Name VARCHAR(100)
);

INSERT INTO Employee (Id, 
Name, Salary, DepartmentId) VALUES
(1, 'Joe', 70000, 1),
(2, 'Jim', 90000, 1), 
(3, 'Henry', 80000, 2),
(4, 'Sam', 60000, 2),
(5, 'Max', 90000, 1);

INSERT INTO Department (Id, Name) VALUES
(1, 'IT'),
(2, 'Sales');

select Name, Salary, DepartmentId from (
select e.Name, e.Salary, e.DepartmentId, 
        dense_rank() over(partition by e.DepartmentId order by e.Salary desc) as rnk
from Employee e 
left join Department d 
 on d.id = e.DepartmentId) as sub 
 where rnk = 1;
