CREATE TABLE Employees (
EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
HireDate DATE
);


INSERT INTO Employees (
FirstName, 
LastName, 
HireDate) VALUES
('John', 'Doe', '2021-05-01'),
('Jane', 'Smith', '2020-07-15');

Questions : Write an SQL query to change the data type of the HireDate column in the Employees table to DATETIME.



alter table Employees
modify column HireDate datetime;

select * from Employees;
