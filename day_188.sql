

CREATE TABLE Orders ( 
OrderID INT PRIMARY KEY,
CustomerID INT, 
OrderDate DATE, 
DeliveryDate DATE
);

INSERT INTO Orders VALUES
(1, 101, '2024-01-10', '2024-01-15'), 
(2, 102, '2024-02-05', NULL),
(3, 103, '2024-01-15', '2024-01-20'), 
(4, 104, '2024-02-01', '2024-02-03'),
(5, 105, '2024-01-25', '2024-01-30'), 
(6, 106, '2024-01-18', '2024-01-20'), 
(7, 107, '2024-02-10', NULL),
(8, 108, '2024-02-15', '2024-02-16'), 
(9, 109, '2024-01-12', '2024-01-17'),
(10, 110, '2024-02-01', '2024-02-02'), 
(11, 111, '2024-01-20', '2024-01-25'), 
(12, 112, '2024-02-05', NULL),
(13, 113, '2024-01-28', '2024-02-01'), 
(14, 114, '2024-02-08', '2024-02-10'), 
(15, 115, '2024-02-12', NULL);


Questions : This question asks you to classify the delivery status of orders into three categories: 'Pending', 'Delivered On Time', and 'Late Delivery',
            based on whether the DeliveryDate is NULL or falls before or after the OrderDate.

select OrderID,
        case when DeliveryDate is null then "Pending"
             when DeliveryDate < OrderDate then "Late Deliver"
             else "Delivery on time" end as delivery_status
from Orders;

