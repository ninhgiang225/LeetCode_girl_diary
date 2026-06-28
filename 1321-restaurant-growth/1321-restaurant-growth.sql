# Write your MySQL query statement below
-- find the sum of daily amount in total (group by is used to find daily amount)
with cte as (
    select 
        visited_on,
        sum(amount) as amount
    from Customer
    group by visited_on
), cte_2 as (
    select
        visited_on,
        sum(amount) over(order by visited_on rows between 6 Preceding and current row) as amount,
        round(avg(amount) over(order by visited_on rows between 6 Preceding and current row),2) as average_amount,
        count(visited_on) over(order by visited_on rows between 6 Preceding and current row) as count_visit
    from cte 
)
select 
    visited_on,
    amount,
    average_amount
from cte_2
where count_visit = 7
order by visited_on
