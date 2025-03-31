
Questions : Write a query to calculate the maximum depth (or level) of employees under any manager. The depth is defined as the number of levels below the top manager.



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
(7, 'Grace White', 3),
(8, 'Helen Green', 4);


with recursive emp_tree as (
select EmployeeID, EmployeeName, ManagerID, 1 as depth
from Employees
where ManagerID is NULL

union all 

select e.EmployeeID, e.EmployeeName, e.ManagerID, et.depth + 1 
from Employees e 
inner join emp_tree et 
  on et.EmployeeID = e.ManagerID
)
select max(depth) as max_depth from emp_tree
