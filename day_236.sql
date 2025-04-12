

Questions : Write an SQL query to delete all duplicate employee records from the Employees table, keeping only one record for each unique email.
            Assume the Employees table contains EmployeeID, EmployeeName, and Email columns.


CREATE TABLE Employees (
EmployeeID INT, EmployeeName VARCHAR(255), 
Email VARCHAR(255)
);
 
INSERT INTO Employees (EmployeeID, EmployeeName, Email) VALUES
(1, 'Amit Sharma', 'amit.sharma@example.com'), 
(2, 'Priya Patel', 'priya.patel@example.com'), 
(3, 'Amit Sharma', 'amit.sharma@example.com'),
(4, 'Rajesh Kumar', 'rajesh.kumar@example.com'), 
(5, 'Amit Sharma', 'amit.sharma@example.com'), 
(6, 'Neha Gupta', 'neha.gupta@example.com'),
(7, 'Ravi Mehra', 'ravi.mehra@example.com'),
(8, 'Amit Verma', 'amit.sharma@example.com'),
(9, 'Sandeep Singh', 'sandeep.singh@example.com'), 
(10, 'Kavita Reddy', 'kavita.reddy@example.com'),
(11, 'Ravi Mehra', 'ravi.mehra@example.com');


delete e1 from Employees e1
join Employees e2 
on e1.Email = e2.Email
and e1.EmployeeID > e2.EmployeeID;
