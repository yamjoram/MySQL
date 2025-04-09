CREATE TABLE Cars (
ModelID INT,
ModelName VARCHAR(255), ReleaseYear INT,
Price DECIMAL(10, 2), Status VARCHAR(50)
);


Questions : Write an SQL query to insert a new car model into the Cars table with the following details:
            • ModelID = 501
            • ModelName = 'Model X' • ReleaseYear = 2024
            • Price = 89999.99
            • Status = 'Available'


insert into Cars(ModelID, ModelName, ReleaseYear,
Price, Status)
values("501", "Model X", "2024", "89999.99", "Available");
