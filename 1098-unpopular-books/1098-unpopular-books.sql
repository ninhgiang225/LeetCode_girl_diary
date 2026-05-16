-- # Write your MySQL query statement below
-- # Gina lam cau nay 
with exclude as (
    select 
        book_id,
        name
    from Books
    where available_from < DATE_SUB('2019-06-23', INTERVAL 30 DAY) 
), master as (
    select 
        b.book_id,
        sum(quantity) as sum_quantity
    from exclude b
    right join Orders o 
    on b.book_id = o.book_id
    where o.dispatch_date >= DATE_SUB('2019-06-23', INTERVAL 365 DAY) and b.book_id is not null
    group by book_id
    having sum(quantity) >= 10 
)
select b.book_id, b.name from exclude
left join Books b
using(book_id)
where b.book_id not in(select book_id from master)







