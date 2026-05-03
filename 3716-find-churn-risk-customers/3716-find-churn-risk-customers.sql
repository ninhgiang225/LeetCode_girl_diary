# Gina lam cau nay 
with max_metrics as (
    select 
        user_id,
        max(monthly_amount) as max_historical_amount,
        max(event_date) as latest_date,
        datediff(max(event_date), min(event_date)) as days_subscribing
    from subscription_events
    group by user_id
), master as (
    select 
        a.user_id, event_date,latest_date,event_type,plan_name,monthly_amount,max_historical_amount, days_subscribing
    from subscription_events a
    left join max_metrics b
    on a.user_id = b.user_id
    where a.user_id in (
        select user_id 
        from subscription_events 
        where event_type = 'downgrade')
    and days_subscribing >= 60
), active_user as (
    select 
        user_id
    from master
    where event_date = latest_date and event_type = 'cancel'

)
select 
    user_id, plan_name as current_plan, 
    monthly_amount as current_monthly_amount, 
    max_historical_amount,
    days_subscribing as days_as_subscriber
from master
where user_id not in (select * from active_user)
and monthly_amount < max_historical_amount * 0.5
order by days_as_subscriber desc, user_id

