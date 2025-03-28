Questions : Write a query that uses a Recursive CTE to calculate the factorial of a given number (e.g., 5!
= 5 × 4 × 3 × 2 × 1 = 120).


with recursive factorial(n, fac) as (
select 1, 1
union all 
select n + 1, fac * (n+1)
from factorial
where n < 5)
select n, fac from factorial;
