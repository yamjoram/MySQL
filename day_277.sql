

Questions : Write an SQL query to calculate the quality of each query. The quality is defined as the average of the ratio between the query's rating and its position. 
            The result should be rounded to two decimal places.



CREATE TABLE Queries (
query_name VARCHAR(255), 
result VARCHAR(255), 
position INT,
rating INT
);


INSERT INTO Queries (query_name, result, position, rating) VALUES
('Dog', 'Golden Retriever', 1, 5), 
('Dog', 'German Shepherd', 2, 5), 
('Dog', 'Mule', 200, 1),
('Cat', 'Shirazi', 5, 2),
('Cat', 'Siamese', 3, 3), 
('Cat', 'Sphynx', 7, 4);

select query_name, round(avg(rating/position),2) as quality 
from Queries
group by 1;
