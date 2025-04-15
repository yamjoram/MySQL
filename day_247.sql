

Questions : Write an SQL query to find all dates' id with a higher temperature compared to its previous day's temperature.



CREATE TABLE Weather (
id INT PRIMARY KEY, 
recordDate DATE, 
temperature INT
);


INSERT INTO Weather (id, recordDate, temperature) VALUES
(1, '2015-01-01', 10),
(2, '2015-01-02', 25), 
(3, '2015-01-03', 20),
(4, '2015-01-04', 30);


select w1.id
from Weather w1 
left join Weather w2 
on w1.recordDate = date_add(w2.recordDate, interval 1 day)
where w1.temperature > w2.temperature;
