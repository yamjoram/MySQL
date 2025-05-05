
Questions : Find all email addresses from the users table that are from Gmail but have non-standard domains (i.e., they do not end with "gmail.com", 
            but may have additional subdomains). Output the user ID, email address, and the domain part of the email (after the '@' symbol).



CREATE TABLE users (
user_id INT PRIMARY KEY,
email VARCHAR(255) );


INSERT INTO users (user_id, email) VALUES
(1, 'john.doe@gmail.com'),
(2, 'jane.smith@gmail.co.uk'),
(3, 'alice.jones@subdomain.gmail.com'),
(4, 'bob.brown@yahoo.com'),
(5, 'carol.taylor@gmail.com'),
(6, 'david.wilson@xyz.gmail.com'),
(7, 'emily.miller@abc.subdomain.gmail.com'),
(8, 'michael.davis@googlemail.com'),
(9, 'susan.martin@google.com'),
(10, 'jackson.lee@subdomain.gmail.com');


select user_id, email, substring_index(email,"@", -1) as domain 
from users
where email regexp "^.*gmail\\..+"
and email not regexp "@gmail\\.com$";

-------alternative 

SELECT 
  user_id,
  email,
  SUBSTRING_INDEX(email, '@', -1) AS domain
FROM users
WHERE 
  SUBSTRING_INDEX(email, '@', -1) LIKE '%gmail%'
  AND SUBSTRING_INDEX(email, '@', -1) != 'gmail.com';
