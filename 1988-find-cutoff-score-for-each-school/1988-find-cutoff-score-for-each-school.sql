
# Write your MySQL query statement below
# gina lam cau nay
with cte as (
    select
        school_id, 
        max(student_count) as student_count
    from Schools a left join Exam b
    on a.capacity >= b.student_count
    group by school_id
)
select 
    school_id, 
    Coalesce(min(score), -1) as score
from cte a left join Exam b 
on a.student_count = b.student_count
group by school_id

