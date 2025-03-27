## 
Write a query that uses a Recursive CTE to generate the first 10 numbers of the Fibonacci sequence (0, 1, 1, 2, 3, 5, 8, 13, 21, 34).

with recursive fibonacci  (n, fib1, fib2) as (
select 1, 0, 1 
union all 
select n + 1, fib2, fib1 + fib2
from fibonacci
where n < 10)
select n, fib1 as fib_num from fibonacci;
