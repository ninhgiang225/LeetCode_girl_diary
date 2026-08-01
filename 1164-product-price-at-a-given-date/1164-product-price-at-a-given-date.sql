# Write your MySQL query statement below
# gina lam cau nay
with tracking_date as (
    select 
        product_id,
        new_price,
        change_date,
        row_number() over(partition by product_id order by change_date) as idx
    from Products
    where change_date <= '2019-08-16'
), right_spot as (
    select 
        product_id,
        max(idx) as spot
    from tracking_date
    group by product_id
)
select 
    product_id,
    new_price as price 
from tracking_date
where (product_id, idx) in (select product_id, spot from right_spot) 
union 
select 
    product_id,
    10 as price
from Products
where product_id not in (select product_id from tracking_date)







# some cases
# 2) price change at or right before '2019-08-16'  -> select price where index = argmax
# 3) price doesn't change before '2019-08-16' -> select 10 


