# Write your MySQL query statement below
# gina lam cau nay

with extracting_post as (
    select distinct sub_id as post_id
    from Submissions
    where parent_id is null
), extracting_number_of_comments as (
    select 
        count(distinct sub_id) as number_of_comments,
        post_id
    from Submissions a
    left join extracting_post b
    on a.parent_id = b.post_id
    where parent_id is not null and post_id is not null
    group by post_id
)
select a.post_id, COALESCE(b.number_of_comments, 0) as number_of_comments
from extracting_post a left join extracting_number_of_comments b
using(post_id)
order by post_id

