

Questions : Assume there is a table named Departments with a primary key DepartmentID. Write an SQL query to add a foreign key constraint to the Employees table, 
            linking the DepartmentID column to the DepartmentID column in the Departments table.


CREATE TABLE Departments (
DepartmentID INT PRIMARY KEY,
DepartmentName VARCHAR(100) NOT NULL );

CREATE TABLE Employees (
EmployeeID INT PRIMARY KEY AUTO_INCREMENT, 
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
HireDate DATE,
DepartmentID INT
);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Human Resources'),
(2, 'Engineering');

INSERT INTO Employees (EmployeeID, FirstName, LastName, 
HireDate, DepartmentID) VALUES
(1, 'John', 'Doe', '2021-05-01', 1),
(2, 'Jane', 'Smith', '2020-07-15', 2);

alter table Employees
add constraint fk_employees_department
foreign key (DepartmentID)
references Departments (DepartmentID);
