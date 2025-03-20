CREATE TABLE CarModels2023 
( ModelID INT,
ModelName VARCHAR(100) );

CREATE TABLE CarModels2024
( ModelID INT,
ModelName VARCHAR(100) );



INSERT INTO CarModels2023 VALUES 
(1, 'Model S'),
(2, 'Model 3'),
(3, 'Model X'),
(4, 'Model Y');


INSERT INTO CarModels2024 VALUES 
(1, 'Model S'),
(2, 'Model 3'),
(5, 'Cybertruck'),
(6, 'Roadster');

Questions : You are given two tables, CarModels2023 and CarModels2024, which contain the list of Tesla car models for the years 2023 and 2024. 
            Both tables have columns ModelID and ModelName. Write a query to get a unified list of all Tesla car models from both years, ensuring that duplicates are removed.



select ModelName from CarModels2023
union
select ModelName from CarModels2024
where ModelName not in (select ModelName from CarModels2023);
