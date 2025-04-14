


Questions : Write an SQL query to convert all FirstName and LastName values in the Customers table to proper case (e.g., 'john' → 'John').





CREATE TABLE Customers (
CustomerID INT, 
FirstName VARCHAR(255),
LastName VARCHAR(255)
);


INSERT INTO Customers (CustomerID, FirstName, LastName) VALUES
(1, 'john', 'doe'),
(2, 'jane', 'smith'), 
(3, 'rajesh', 'kumar'),
(4, 'neha', 'gupta'),
(5, 'ravi', 'mehra');

update Customers
set FirstName = concat(upper(substring(FirstName, 1, 1)), lower(substring(FirstName,2))),
    LastName = concat(upper(substring(LastName, 1, 1)), lower(substring(LastName,2)));
