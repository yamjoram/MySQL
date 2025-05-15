
Questions : Write an SQL query to find the countries where the telecommunications company can invest. The company wants to invest in countries where the average 
            call duration is strictly greater than the global average call duration.

CREATE TABLE Person (
id INT PRIMARY KEY,
name VARCHAR(100), 
phone_number VARCHAR(100)
);

CREATE TABLE Country (
name VARCHAR(100),
country_code VARCHAR(3) PRIMARY KEY
);

CREATE TABLE Calls ( 
caller_id INT, 
callee_id INT,
duration INT
);

INSERT INTO Person (id, name, phone_number) VALUES
(3, 'Jonathan', '051-1234567'), 
(12, 'Elvis', '051-7654321'), 
(1, 'Moncef', '212-1234567'), 
(2, 'Maroua', '212-6523651'), 
(7, 'Meir', '972-1234567'),
(9, 'Rachel', '972-0011100');

INSERT INTO Country (name, country_code) VALUES
('Peru', '051'), 
('Israel', '972'), 
('Morocco', '212'), 
('Germany', '049'), 
('Ethiopia', '251');

INSERT INTO Calls (caller_id, callee_id, duration) VALUES
    (1, 9, 33),
    (2, 9, 4),
    (1, 2, 59),
    (3, 12, 102),
    (3, 12, 330),
    (12, 3, 5),
    (7, 9, 13),
    (7, 1, 3),
    (9, 7, 1),
    (1, 7, 7);
    


select c.name, avg(ca.duration) as avg_call
from Country c 
left join Person p 
on c.country_code = left(p.phone_number,3)
left join Calls ca 
on ca.caller_id = p.id
group by 1
having avg(ca.duration) > (select avg(duration) as global_duration from Calls);
