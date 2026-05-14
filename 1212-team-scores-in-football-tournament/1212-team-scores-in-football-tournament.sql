-- # Gina lam cau nay 
with master as (
    select host_team as team_a, host_goals as goal_a, guest_team as team_b, guest_goals as goal_b
    from Matches
    union all 
    select guest_team as team_a, guest_goals as goal_a, host_team as team_b, host_goals as goal_b
    from Matches
) , calc_point as (
    select
        team_a,
        case 
            when goal_a > goal_b then 3
            when goal_a = goal_b then 1 
            else 0 
        end as score 
    from master
)
select 
    team_id,
    team_name,
    COALESCE(sum(score), 0) as num_points
from Teams b
left join calc_point a
on team_a = team_id
group by team_a
union 
select team_id, team_name, 0 as num_points
from Teams
where team_id not in (select team_a from master)
order by num_points desc, team_id asc 




