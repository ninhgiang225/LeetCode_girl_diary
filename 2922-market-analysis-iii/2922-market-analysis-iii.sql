with cte as (
    select 
        o.seller_id, 
        count(distinct o.item_id) as num_items,
        rank() over(order by count(distinct o.item_id) desc) as rankk
    from Orders o 
    join Users u 
        on o.seller_id = u.seller_id
    join Items i
        on i.item_id = o.item_id
    where u.favorite_brand <> i.item_brand
    group by o.seller_id
)

select 
    seller_id,
    num_items
from cte
where rankk = 1
order by seller_id;


