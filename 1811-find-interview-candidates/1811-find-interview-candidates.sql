# Write your MySQL query statement below

# gina lam cau nay 

with condition_one as (
    select 
        gold_medal
    from Contests
    group by gold_medal 
    having count(contest_id) >= 3
), master as(
    select contest_id, gold_medal as win_medal
    from Contests
    union all 
    select contest_id, silver_medal as win_medal
    from Contests
    union all 
    select contest_id, bronze_medal as win_medal
    from Contests
    order by win_medal
), calc_difference as (
    select 
        contest_id,
        win_medal,
        contest_id - row_number() over(partition by win_medal order by contest_id) as difference
    from master
), calc_rankk as (
    select 
        contest_id, 
        win_medal,
        difference,
        row_number() over(partition by win_medal, difference) as rankk 
    from calc_difference
)

select 
    b.name, 
    b.mail
from calc_rankk a 
left join Users b 
on a.win_medal = b.user_id 
where a.rankk = 3 or a.win_medal in (select gold_medal from condition_one)
group by a.win_medal





    
