# Write your MySQL query statement below
# Gina lam cau nay
with cte as (
    select
        *, 
        row_number() over(partition by company order by salary) as rank_by_company,
        count(*) over(partition by company) as num_employee
    from Employee
)
select 
    id, 
    company,
    salary
from cte 
where (num_employee % 2 = 0 and (rank_by_company = num_employee / 2 
                                    or rank_by_company = num_employee / 2 + 1))
    or (num_employee % 2 = 1 and rank_by_company = num_employee div 2 + 1)
