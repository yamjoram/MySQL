
Questions : Using recursive cte, write a query to generate number from 1-10.

with recursive numbers as (
  select 1 as num
  union all 
select num + 1 from numbers where num < 10)
select * from numbers;
