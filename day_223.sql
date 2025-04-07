

Questions : Use the CREATE VIEW statement to create a view that selects the EmployeeID, FirstName,
            and LastName columns from the Employees table. Datasets and SQL Schemas

CREATE TABLE Employees (
EmployeeID INT,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
HireDate DATE
);


INSERT INTO Employees (
EmployeeID,
FirstName, 
LastName, 
HireDate) VALUES
(1, 'John', 'Doe', '2021-05-01'),
(2, 'Jane', 'Smith', '2020-07-15');


CREATE view employee_view as 
select EmployeeID, FirstName, LastName
from Employees;
