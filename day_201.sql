CREATE TABLE ElectricTeslaModels ( 
ModelID INT,
ModelName VARCHAR(100) );

CREATE TABLE StandardTeslaModels (
ModelID INT,
ModelName VARCHAR(100) );

INSERT INTO ElectricTeslaModels VALUES 
(1, 'Model S'),
(2, 'Model 3'),
(3, 'Model X'),
(4, 'Model Y');

INSERT INTO StandardTeslaModels VALUES 
(2, 'Model 3'),
(5, 'Cybertruck'),
(6, 'Roadster');

Questions : You are given two tables, ElectricTeslaModels and StandardTeslaModels, that contain lists of Tesla car models. 
            The ElectricTeslaModels table lists models that are electric, and the StandardTeslaModels table lists standard (non-electric) Tesla models. 
            Write a query to get a list of all Tesla models, including electric and non- electric, ensuring that duplicate entries are included when a model appears in both tables.


select * from ElectricTeslaModels
union all 
select * from StandardTeslaModels;
