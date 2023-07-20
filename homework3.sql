--Q1
select customer.first_name,customer.last_name,state.state from customer
INNER JOIN address
ON customer.customer_id =address.customer_id
INNER JOIN state
ON address.address_id = state.address_id

where state.state = 'TX';

--Q2
SELECT customer.first_name, customer.last_name, payment.amount FROM payment
INNER JOIN customer on payment.customer_id = customer.customer_id
WHERE amount>6.99;






--Q3
SELECT customer.first_name, customer.last_name
FROM customer
WHERE customer_id IN (
 SELECT customer_id
 FROM payment
 WHERE amount > 175
);




--Q4
select customer.first_name, customer.last_name, country.country from customer
INNER JOIN address ON customer.address_id = address.address_id
INNER JOIN city ON address.city_id = city.city_id
INNER JOIN country on city.country_id = country.country_id
WHERE country.country = 'Nepal';




--Q5
select staff.first_name, staff.last_name from staff where staff_id in (select staff_id from transaction
group by staff_id
order by count(*) DESC
limit 1)




--Q6
select rating.rating_id,rating_level,COALESCE(movie_count, 0) from rating
left JOIN(select rating_id, count(*) as movie_count from movies
group by rating_id) movie2
on rating.rating_id = movie2.rating_id





--Q7
select customer.first_name,customer.last_name from customer where customer_id IN (select customer_id FROM
(select * from payment
where amount > 6.99) payment2 
group by customer_id
HAVING count(*) = 1)





--Q8
select count (*) from rental where rental_id IN(select rental_id from rental
where price = 0)




