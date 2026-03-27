with dedup as (
    select
        distinct 
            id, 
            login_date
    from logins
), 
calc_prev_date as (
    select 
        *, 
        lag(login_date) over(partition by id order by login_date) prev_login_date
    from dedup
), 
calc_diff as (
    select 
        *, 
        coalesce(datediff(login_date, prev_login_date),1) as diff_between_logins, 
        case 
            when coalesce(datediff(login_date, prev_login_date),1) = 1 then 0 
            else 1
        end 
        as changing_signal 
    from calc_prev_date 
), 
calc_groups as (
    select 
        id, 
        sum(changing_signal) over(partition by id order by login_date) as group_id
    from calc_diff
), 
final as (
    select 
        id, 
        group_id
    from calc_groups
    group by 1,2
    having count(*) >= 5 
    order by 1,2 
)
select 
    distinct 
    id, 
    name
from final 
join Accounts 
using(id)
order by 1