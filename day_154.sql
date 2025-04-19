



Questions : Write an SQL query to find the name of the product with the highest price in each country.






CREATE TABLE suppliers (
supplier_id INT PRIMARY KEY,
supplier_name VARCHAR(25),
country VARCHAR(25)
);

INSERT INTO suppliers (supplier_id, supplier_name, country) VALUES
(501, 'alan', 'India'), 
(502, 'rex', 'US'), 
(503, 'dodo', 'India'), 
(504, 'rahul', 'US'), 
(505, 'zara', 'Canada'),
(506, 'max', 'Canada');

CREATE TABLE products (
product_id INT PRIMARY KEY,
product_name VARCHAR(25),
supplier_id INT,
price FLOAT,
FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id));

INSERT INTO products (product_id, product_name, supplier_id, price) VALUES
(201, 'iPhone 14', 501, 1299),
(202, 'iPhone 8', 502, 999),
(204, 'iPhone 13', 502, 1199),
(203, 'iPhone 11', 503, 1199),
(205, 'iPhone 12', 502, 1199),
(206, 'iPhone 14', 501, 1399),
(214, 'iPhone 15', 503, 1499),
(207, 'iPhone 15', 505, 1499),
(208, 'iPhone 15', 504, 1499),
(209, 'iPhone 12', 502, 1299),
(210, 'iPhone 13', 502, 1199),
(211, 'iPhone 11', 501, 1099),
(212, 'iPhone 14', 503, 1399),
(213, 'iPhone 8', 502, 1099),
(222, 'Samsung Galaxy S21', 504, 1699), 
(223, 'Samsung Galaxy S20', 505, 1899), 
(224, 'Google Pixel 6', 501, 899),
(225, 'Google Pixel 5', 502, 799), 
(226, 'OnePlus 9 Pro', 503, 1699),
(227, 'OnePlus 9', 502, 1999),
(228, 'Xiaomi Mi 11', 501, 899),
(229, 'Xiaomi Mi 10', 504, 699),
(230, 'Huawei P40 Pro', 505, 1099),
(231, 'Huawei P30', 502, 1299),
(232, 'Sony Xperia 1 III', 503, 1199), 
(233, 'Sony Xperia 5 III', 501, 999), 
(234, 'LG Velvet', 505, 1899),
(235, 'LG G8 ThinQ', 504, 799),
(236, 'Motorola Edge Plus', 502, 1099),
(237, 'Motorola One 5G', 501, 799),
(238, 'ASUS ROG Phone 5', 503, 1999),
(239, 'ASUS ZenFone 8', 504, 999),
(240, 'Nokia 8.3 5G', 502, 899),
(241, 'Nokia 7.2', 501, 699),
(242, 'BlackBerry Key2', 504, 1899),
(243, 'BlackBerry Motion', 502, 799),
(244, 'HTC U12 Plus', 501, 899),
(245, 'HTC Desire 20 Pro', 505, 699),
(246, 'Lenovo Legion Phone Duel', 503, 1499), 
(247, 'Lenovo K12 Note', 504, 1499),
(248, 'ZTE Axon 30 Ultra', 501, 1299),
(249, 'ZTE Blade 20', 502, 1599),
(250, 'Oppo Find X3 Pro', 503, 1999);

select country, product_name, price from (
select s.country, p.product_id, p.product_name, p.price,
      dense_rank() over (partition by s.country order by p.price desc) as rnk
from suppliers s 
left join products p
  on p.supplier_id = s.supplier_id) as sub 
  where rnk = 1
;
