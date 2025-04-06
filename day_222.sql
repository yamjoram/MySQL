

Questions : Write an SQL query to add a primary key constraint to the EmployeeID column in the Employees table.

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


ALTER TABLE Employees ADD PRIMARY KEY (EmployeeID);
