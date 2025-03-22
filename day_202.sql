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

Question_1 : Write a query to find the car models that are common to both electric and hybrid categories.

select ModelName from ElectricTeslaModels
where ModelName in (
select ModelName from StandardTeslaModels);


Question_2 : Write a query to find the car models that are unique to either electric or hybrid.
  

select ModelName from ElectricTeslaModels
where ModelName not in (select ModelName from StandardTeslaModels)
union
select ModelName from StandardTeslaModels
where ModelName not in (select ModelName from ElectricTeslaModels);
