



CREATE TABLE Cars (
ModelID INT,
ModelName VARCHAR(255), ReleaseYear INT,
Price DECIMAL(10, 2), Status VARCHAR(50)
);


INSERT INTO Cars (ModelID, ModelName, ReleaseYear, Price, Status)
VALUES
(601, 'Model A', 2017, 45999.99, 'Discontinued'), 
(602, 'Model B', 2019, 50999.99, 'Available'),
(603, 'Model C', 2018, 47999.99, 'Discontinued');


Question : Write an SQL query to delete all cars from the Cars table that were released before 2019.

delete from Cars
where ReleaseYear < 2019;
