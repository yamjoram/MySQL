CREATE TABLE Cars (
ModelID INT,
ModelName VARCHAR(255), 
ReleaseYear INT,
Price DECIMAL(10, 2), 
Status VARCHAR(50)
);


INSERT INTO Cars (ModelID, ModelName, ReleaseYear, Price, Status)
VALUES
(502, 'Model Y', 2023, 79999.99, 'Sold Out');


Questions : Write an SQL query to update the Price of the car model with ModelID = 502 to 74999.99 in the Cars table.

update Cars
set Price = "74999.99"
where ModelID = 502;
