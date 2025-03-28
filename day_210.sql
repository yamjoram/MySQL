
Questions : Write a query using a Recursive CTE to generate a date range from '2024-01-01' to '2024- 01-10'. Return all the dates in this range.


with recursive date_range as (
select cast('2024-01-01' as date) as current_date
union all 
select date_add(current_date, interval 1 day) 
from date_range
where current_date < '2024-01-10')
select current_date from date_range;
