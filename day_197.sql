CREATE TABLE WebsiteFeedback (
CustomerID INT,
Feedback TEXT
);
 
CREATE TABLE StoreFeedback ( 
CustomerID INT,
Feedback TEXT
);
 
 
INSERT INTO WebsiteFeedback VALUES
(1, 'Great website!'),
(2, 'Easy to navigate'),
(3, 'Loved the product range'), 
(4, 'Excellent service');

INSERT INTO StoreFeedback VALUES
(1, 'Great website!'),
(5, 'Friendly staff'),
(6, 'Store was clean and organized'), 
(4, 'Excellent service');

Questions : You are given two tables, WebsiteFeedback and StoreFeedback, where both tables store customer feedback for a company. Each table has CustomerID and Feedback columns.
            The WebsiteFeedback table contains feedback from the website, and the StoreFeedback table contains feedback from physical stores. Write a query to merge these tables 
            and return a unified list of feedback, removing any duplicate entries.


  
select * from WebsiteFeedback
union
select * from StoreFeedback;
