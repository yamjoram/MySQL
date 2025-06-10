

Questions : Write a SQL query to select the Supplier_id, Product_id, and start date of the period when the stock quantity was below 50 units for more than two consecutive days.

CREATE TABLE inventory (
record_id INT PRIMARY KEY,
supplier_id INT, 
product_id INT, 
stock_quantity INT, 
record_date DATE
);

INSERT INTO inventory (record_id, 
supplier_id,
product_id, 
stock_quantity, 
record_date) VALUES
(1, 201, 301, 60, '2023-01-01'), (2, 201, 301, 45, '2023-01-02'),
(3, 201, 301, 30, '2023-01-03'), (4, 201, 301, 40, '2023-01-04'), 
(5, 201, 301, 20, '2023-01-05'), (6, 202, 302, 80, '2023-01-01'),
(7, 202, 302, 30, '2023-01-02'), (8, 202, 302, 25, '2023-01-03'), 
(9, 202, 302, 50, '2023-01-04'), (10, 203, 303, 90, '2023-01-01'), 
(11, 203, 303, 45, '2023-01-02'), (12, 203, 303, 70, '2023-01-03'), 
(13, 203, 303, 30, '2023-01-04'), (14, 203, 303, 10, '2023-01-05');



WITH filtered_data AS (
    SELECT 
        supplier_id,
        product_id,
        record_date,
        stock_quantity,
        ROW_NUMBER() OVER (PARTITION BY supplier_id, product_id ORDER BY record_date) AS rn
    FROM inventory
    WHERE stock_quantity < 50
),
grouped_data AS (
    SELECT 
        supplier_id,
        product_id,
        record_date,
        DATE_SUB(record_date, INTERVAL rn DAY) AS grp
    FROM filtered_data
),
periods AS (
    SELECT 
        supplier_id,
        product_id,
        MIN(record_date) AS start_date,
        MAX(record_date) AS end_date,
        COUNT(*) AS days_below_50
    FROM grouped_data
    GROUP BY supplier_id, product_id, grp
)
SELECT 
    supplier_id,
    product_id,
    start_date
FROM periods
WHERE days_below_50 > 2;
