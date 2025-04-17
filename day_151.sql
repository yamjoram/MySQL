



Questions : Write an SQL query to report the distance travelled by each user. The result should be ordered by the travelled distance in descending order. 
            If two or more users travelled the same distance, order them by their name in ascending order.




CREATE TABLE Users (
id INT PRIMARY KEY,
name VARCHAR(100) );

CREATE TABLE Rides (
id INT PRIMARY KEY, 
user_id INT, 
distance INT
);

INSERT INTO Users (id, name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Alex'),
(4, 'Donald'), 
(7, 'Lee'),
(13, 'Jonathan'), 
(19, 'Elvis');

INSERT INTO Rides (id, user_id, distance) VALUES
    (1, 1, 120),
    (2, 2, 317),
    (3, 3, 222),
    (4, 7, 100),
    (5, 13, 312),
    (6, 19, 50),
    (7, 7, 120),
    (8, 19, 400),
    (9, 7, 230);
    
select u.id, u.name, coalesce(sum(r.distance),0) as total_distance
from Users u 
left join Rides r 
on u.id = r.user_id
group by 1
order by 3 desc, 2;
