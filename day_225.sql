

Questions : Write an SQL query to create a non-unique index on the LastName column in the Employees table to improve search performance.



  
CREATE TABLE Employees (
EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
HireDate DATE
);


INSERT INTO Employees (FirstName, LastName, HireDate) VALUES
('John', 'Doe', '2021-05-01'),
('Jane', 'Smith', '2020-07-15'),
('Alice', 'Johnson', '2019-11-20');

create index idx_last_name on Employees(LastName);

select * from Employees
where LastName = "Johnson";
