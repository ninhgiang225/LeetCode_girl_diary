-- Write your MySQL query statement below

-- Gina lam cau nay

with count as (
    select 
        *,
        count(*) as vote_count
    from Votes
    group by voter
), master as(
    select 
        a.voter,
        a.candidate,
        sum(1/b.vote_count) as received_vote
    from Votes a
    left join count b
    on a.voter = b.voter
    group by a.candidate
    order by 3
)
select
    candidate
from master
where received_vote = (select max(received_vote) from master)
order by 1

