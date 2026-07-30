# Write your MySQL query statement below
# gina lam cau nay

with tracking as (
    select 
        s.user_id,
        count(c.action) as total_sent
    from Confirmations c
    left join Signups s
    on c.user_id = s.user_id
    group by user_id
), confirmed_user as (
    select 
        distinct user_id,
        count(action) as total_confirmed
    from Confirmations
    where action = "confirmed"
    group by user_id
), full_tracking as(
    select 
        t.user_id, 
        ROUND(COALESCE(total_confirmed,0) / total_sent, 2)  as confirmation_rate
    from tracking t
    left join confirmed_user c
    on t.user_id = c.user_id
)
select 
    s.user_id, 
    COALESCE(confirmation_rate, 0.00) as confirmation_rate
from Signups s
left join full_tracking f
using(user_id)



