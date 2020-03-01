select * from customer;

select * from film;

select email
from customer
where first_name = 'Nancy'
and last_name = 'Thomas';

select description
from film
where title = 'Outlaw Hanky';

select phone
from address
where address = '259 Ipoh Drive';

select count(distinct(amount))
from payment;

select first_name, last_name
from customer
order by first_name asc, last_name desc;

select customer_id, amount from payment
order by amount desc 
limit 10;

select title, film_id from film
order by film_id
limit 5;

select amount, payment_date from payment
where payment_date between '2007-02-15' and '2007-02-20';

select first_name, last_name
from customer
where first_name like 'Gr_ce';

select count(amount) from payment
where amount > 5;

select count(first_name) from actor
where first_name like 'P%';

select * from address;

select distinct district from address;

select count(*) from film
where rating = 'R'
and replacement_cost between 5 and 15;

select count(*) from film
where title like '%Truman%';

-- MIN MAX AVG SUM ROUND
select count(amount) from payment
where amount = 0;

select count(*) from payment;

select staff_id, sum(amount), count(amount) from payment
group by staff_id;

select rating, round(avg(replacement_cost), 2) from film
group by rating
order by avg(replacement_cost) desc;

select customer_id, sum(amount) from payment
group by customer_id
order by sum(amount) desc
limit(5);

select rating, avg(rental_rate)
from film
where rating in ('R', 'G', 'PG')
group by rating
having avg(rental_rate) < 3;

select customer_id, count(payment_id)
from payment
group by customer_id
--order by count(payment_id) desc;
having count(payment_id) >= 40;

select rating, avg(rental_duration)
from film
group by rating
having avg(rental_duration) > 5;

-- ########## Assessment 1 ##########

-- 1. Return the customer IDs of customers who have spent at least $110 with the staff member who has an ID of 2.
-- The answer should be customers 187 and 148.
select customer_id, sum(amount)
from payment
where staff_id = 2
group by customer_id
having sum(amount) >= 110;

-- 2. How many films begin with the letter J?
-- The answer should be 20.
select count(*)
from film
where title like 'J%';

-- 3. What customer has the highest customer ID number whose name starts with an 'E' and has an address ID lower than 500?
-- The answer is Eddie Tomlin
select first_name, last_name
from customer
where first_name like 'E%'
and address_id < 500
order by customer_id desc
limit 1;
-- ##################################

-- Useful links about JOINS:
-- https://blog.codinghorror.com/a-visual-explanation-of-sql-joins/
-- http://www.sql-join.com/
-- https://en.wikipedia.org/wiki/Join_(SQL)


-- ======== ADVANCED SQL COMMANDS ========

-- Timestamp and extract
select
	sum(amount) as total,
	extract(month from payment_date) as month
from payment p
group by month
order by total desc
limit(1);

-- Mathematical functions.
-- More details in https://www.postgresql.org/docs/9.5/functions-math.html
select customer_id, address_id, customer_id + address_id as new_id
from customer c;

select AVG(amount)
from payment p;

-- String functions and operators

select first_name || ' ' || last_name as full_name  
from customer c;

select	first_name, char_length(first_name)
from customer c;

select	upper(first_name)
from customer c;

select	lower(first_name)
from customer c;

-- Subquery

--Suppose we want to find the films whose rental rate 
--is higher than the average rental rate

-- Firt solution:
select avg(rental_rate) from film;  -- 2.98

select title, rental_rate
from film f
where rental_rate > 2.98;

-- Second and more elegant solution
select title, rental_rate
from film f
where rental_rate > (select avg(rental_rate) from film f2);

-- A more complex example of subquery:
select film_id, title
from film
where film_id in (
	select inventory.film_id
	from rental
	inner join inventory on inventory.inventory_id = rental.inventory_id
	where rental.return_date between '2005-05-29' and '2005-05-30'
);

-- Self join
select
	a.customer_id,
	a.first_name,
	a.last_name,
	b.customer_id,
	b.first_name,
	b.last_name
from customer as a, customer as b
where a.first_name = b.last_name
order by a.customer_id;

-- another way to write the same query with self join
select
	a.customer_id,
	a.first_name,
	a.last_name,
	b.customer_id,
	b.first_name,
	b.last_name
from customer as a
join customer as b
on a.first_name = b.last_name
order by a.customer_id;










