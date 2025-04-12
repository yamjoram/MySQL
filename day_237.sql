

Questions : Write an SQL query to update all NULL values in the Email column of the Customers table with a default value of 'noemail@unknown.com'.



CREATE TABLE Customers (
CustomerID INT, CustomerName VARCHAR(255),
Email VARCHAR(255) );


INSERT INTO Customers (CustomerID, CustomerName, Email) VALUES
(1, 'John Doe', 'john.doe@example.com'),
(2, 'Jane Smith', NULL),
(3, 'Sam Johnson', 'sam.johnson@example.com'),
(4, 'Mike Brown', NULL),
(5, 'Emily Davis', 'emily.davis@example.com');


update Customers
set Email = "noemail@unknown.com"
where Email is null;
