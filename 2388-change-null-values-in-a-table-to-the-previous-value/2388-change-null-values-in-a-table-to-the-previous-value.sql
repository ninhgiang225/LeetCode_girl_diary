# Write your MySQL query statement below

# Gina lam cau nay 
with cte as (
    select 
        *, 
        row_number() over() as rankk
    from CoffeeShop
)
select 
    a.id, 
    case 
        when a.drink is null then b.drink
        else a.drink
    end as drink
from cte a
left join cte b 
on b.rankk < a.rankk        # b will be the reference
and b.drink is not null
group by a.id 
