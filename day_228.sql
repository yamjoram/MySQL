
Questions : Write an SQL query to update the JobTitle of the employee with EmployeeID = 3 to 'Senior Software Engineer' in the Employees table.


CREATE TABLE Employees (
EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
JobTitle VARCHAR(100),
HireDate DATE
);


INSERT INTO Employees (FirstName, LastName, JobTitle, HireDate) 
VALUES
( 'John', 'Doe', 'Software Engineer', '2021-05-01'),
( 'Jane', 'Smith', 'Data Analyst', '2020-07-15'),
( 'Alice', 'Johnson', 'Software Engineer', '2019-11-20');

update Employees
set JobTitle = "Senior Software Engineer"
where EmployeeID = 3;
