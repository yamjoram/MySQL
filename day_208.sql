CREATE TABLE Employees (
EmployeeID INT PRIMARY KEY, 
EmployeeName VARCHAR(100), 
ManagerID INT
);

INSERT INTO Employees VALUES
(1, 'John Doe', NULL),
(2, 'Alice Smith', 1),
(3, 'Bob Brown', 1),
(4, 'Charlie Davis', 2),
(5, 'Eve Harris', 2),
(6, 'Frank Black', 3),
(7, 'Grace White', 3);


Questions : Write a query to generate a report showing each employee's name and their manager's name, starting from the top-level manager and recursively listing employees under them.

with recursive emplo as (
select EmployeeID, EmployeeName, ManagerID, 1 as Level
from Employees
where ManagerID is null

union all

select e.EmployeeID, e.EmployeeName, e.ManagerID, em.Level + 1 
from Employees e
inner join emplo as em 
  on e.ManagerID = em.EmployeeID
)
select * from emplo;


