# Write your MySQL query statement below


# GINA lam cau nay 

with first_filter as (
    select *, count(city) as num_city
    from cities
    group by state 
    having count(city) >= 3
), second_filter as (
    select 
        state,
        count(state) as matching_letter_count
    from cities
    where state in (
        select state from first_filter
    ) and LEFT(city, 1) = LEFT(state, 1)
    group by state
)
select 
    a.state, 
    GROUP_CONCAT(city ORDER BY city ASC SEPARATOR ', ') as cities,
    matching_letter_count
from cities a
left join second_filter b 
on a.state = b.state
where b.state is not null 
group by a.state
order by matching_letter_count desc, a.state asc









