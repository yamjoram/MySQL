CREATE TABLE ProductReviews ( 
ProductID INT PRIMARY KEY, 
Rating DECIMAL(3, 2)
);

INSERT INTO ProductReviews VALUES
(101, 4.7),
(102, 3.5),
(103, 2.9),
(104, 4.0),
(105, 4.8),
(106, 3.2),
(107, 4.4),
(108, 3.8),
(109, 4.1),
(110, 2.5),
(111, 3.6),
(112, 4.9),
(113, 3.0),
(114, 2.0),
(115, 4.2);


Questions : This question requires you to categorize products based on their Rating. The categories are 'Excellent' for 
            ratings 4.5 and above, 'Good' for ratings between 3.5 and 4.4, and 'Average' for ratings below 3.5.

select ProductID,
        case when Rating >= 4.5 then "Excellent"
              when Rating between 4.4 and 3.5 then "Good"
              else "Average" end as Rating_status
from ProductReviews;
