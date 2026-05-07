# Write your MySQL query statement below

# GINA lam cau nay

with rank_driver as (
    select 
        c.driver_id, 
        round(avg(rating), 2) as average_rating,
        b.fuel_type,
        sum(a.distance) as distance, 
        row_number() over(partition by b.fuel_type
                        order by avg(rating) desc, sum(a.distance) desc, 
                                c.accidents asc) as ranking

    from Trips a 
    left join Vehicles b
    on a.vehicle_id = b.vehicle_id
    left join Drivers c
    on b.driver_id = c.driver_id
    group by c.driver_id, b.fuel_type

)
select 
    fuel_type,
    driver_id,
    average_rating as rating,
    distance
from rank_driver
where ranking = 1
order by fuel_type asc

