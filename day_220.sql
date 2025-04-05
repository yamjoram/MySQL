
Questions : Rename the table employees to staff

CREATE TABLE Employees (
EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
HireDate DATE
);

INSERT INTO Employees (FirstName, LastName, HireDate) VALUES
('John', 'Doe', '2021-05-01'),
('Jane', 'Smith', '2020-07-15');


alter table Employees
rename to staff;
