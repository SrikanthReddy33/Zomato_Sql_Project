drop table if exists customers;
create table customers
 		(
		 customer_id INT primary key,
		 customer_name varchar(20),
		 reg_date date
		 );


drop table if exists restaurants;
create table restaurants
		(
		restaurant_id INT primary key,	
		restaurant_name	varchar(35),
		city varchar(20),	
		opening_hours varchar(100)
		);
		
drop table if exists orders;
create table orders
		(
		order_id INT primary key,
		customer_id	INT ,-- this is coming from customer table
		restaurant_id INT, -- this is coming from restaurant table
		order_item	varchar(40),
		order_date	date,
		order_time	time,
		order_status varchar(15),
		total_amount float
		);


drop table if exists riders;
create table riders
		(rider_id INT primary key, 
		rider_name varchar(30),
		sign_up date
		);


drop table if exists delivery;
create table delivery 
		(
		delivery_id INT primary key,
		order_id INT, --this is coming from order table
		delivery_status varchar(30),
		delivery_time time,
		rider_id INT
		);



select * from customers;
select * from delivery;
select * from orders;
select * from restaurants;
select * from riders;


-- Q.1
-- Write a query to find the top 5 most frequently ordered dishes by customer called "Arjun Mehta" in the last 1 year.

select customer_name, dishes, total_orders
from(
	select customers.customer_id,
		   order_item as dishes,
		   customer_name,
		   reg_date,
		   count(*) as total_orders,
		   dense_rank() over(order by count(*) desc)as rank
	from orders
	join customers on orders.customer_id=customers.customer_id
	where customer_name='Arjun Mehta' and reg_date between '2023-01-01' and '2023-12-12'
	group by 1,2,3
	order by 3 desc) as t1
where rank <= 5


-- 2. Popular Time Slots
-- Question: Identify the time slots during which the most orders are placed. based on 2-hour intervals.

select
	  case 
		WHEN EXTRACT(HOUR FROM order_time) BETWEEN 0 AND 1 THEN '00:00 - 02:00'
        WHEN EXTRACT(HOUR FROM order_time) BETWEEN 2 AND 3 THEN '02:00 - 04:00'
        WHEN EXTRACT(HOUR FROM order_time) BETWEEN 4 AND 5 THEN '04:00 - 06:00'
        WHEN EXTRACT(HOUR FROM order_time) BETWEEN 6 AND 7 THEN '06:00 - 08:00'
        WHEN EXTRACT(HOUR FROM order_time) BETWEEN 8 AND 9 THEN '08:00 - 10:00'
        WHEN EXTRACT(HOUR FROM order_time) BETWEEN 10 AND 11 THEN '10:00 - 12:00'
        WHEN EXTRACT(HOUR FROM order_time) BETWEEN 12 AND 13 THEN '12:00 - 14:00'
        WHEN EXTRACT(HOUR FROM order_time) BETWEEN 14 AND 15 THEN '14:00 - 16:00'
        WHEN EXTRACT(HOUR FROM order_time) BETWEEN 16 AND 17 THEN '16:00 - 18:00'
        WHEN EXTRACT(HOUR FROM order_time) BETWEEN 18 AND 19 THEN '18:00 - 20:00'
        WHEN EXTRACT(HOUR FROM order_time) BETWEEN 20 AND 21 THEN '20:00 - 22:00'
        WHEN EXTRACT(HOUR FROM order_time) BETWEEN 22 AND 23 THEN '22:00 - 00:00'
		END AS time_slot,
		COUNT(order_id)AS order_count
from orders 
group by time_slot
order by order_count desc


--Approach 2

select  
		FLOOR(EXTRACT(HOUR FROM order_time)/2)*2 as start_time,
		FLOOR(EXTRACT (HOUR FROM ORDER_TIME)/2)*2 + 2 AS end_time,
		count(*) as total_orders
from orders
group by 1,2
order by 3 desc


-- 3. Order Value Analysis
-- Question: Find the average order value per customer who has placed more than 750 orders.
-- Return customer_name, and aov(average order value)

select customer_name,
	   avg(total_amount) as avg_value,
       count(order_id)as total_orders
from orders 
join customers on customers.customer_id = orders.customer_id
group by customer_name
having count(order_id)>750


-- 4. High-Value Customers
-- Question: List the customers who have spent more than 100K in total on food orders.
-- return customer_name, and customer_id!

select customers.customer_id,
	   customer_name,
	   sum(total_amount) as total_spent
from orders
join customers on orders.customer_id=customers.customer_id
group by  customers.customer_id,
		 customer_name
having sum(total_amount)>'100000'



-- 5. Orders Without Delivery
-- Question: Write a query to find orders that were placed but not delivered. 
-- Return each restuarant name, city and number of not delivered orders.


select * 
from orders
left join 
delivery 
on orders.order_id = delivery.order_id
left join 
restaurants 
on orders.restaurant_id = restaurants.restaurant_id
where delivery_status is null

-- select * from restaurants


-- Q. 6
-- Restaurant Revenue Ranking: 
-- Rank restaurants by their total revenue from the last year, including their name, 
-- total revenue, and rank within their city.

with ranking_table
as
(
	select restaurants.city,
		   restaurant_name,
		   sum(total_amount) as revenue,
		   rank() over(partition by restaurants.city order by sum(orders. total_amount)desc) as rank
	from restaurants
	left join 
	orders
	on restaurants.restaurant_id = orders. restaurant_id
	group by 1,2
)
select * 
from ranking_table
where rank = 1

-- select * from restaurants;


-- Q. 7
-- Most Popular Dish by City: 
-- Identify the most popular dish in each city based on the number of orders.

select * from (
	select orders.order_item as dishes,
		   restaurants.city,
		   count(order_id) as total_orders,
		   rank() over(partition by restaurants.city order by sum(orders.total_amount)desc) as rank
	from orders
	join restaurants 
	on orders.restaurant_id = restaurants.restaurant_id
	group by 1,2
) as t1
where rank=1



-- Q.8 Customer Churn: 
-- Find customers who haven’t placed an order in 2024 but did in 2023.

select distinct customer_id from orders
where 
	extract(year from order_date)=2023
    and 
	customer_id not in(
	select distinct customer_id from orders
where extract(year from order_date)=2024
	)

-- Q.9 Rider Average Delivery Time: 
-- Determine each rider's average delivery time.


select rider_id,
		delivery_time,
		order_time,
		delivery_time - order_time as time_diff
		
from orders 
join delivery 
on orders.order_id = delivery.order_id
where delivery.delivery_status = 'Delivered'

-- select * from delivery


-- Q.10 Monthly Restaurant Growth Ratio: 
-- Calculate each restaurant's growth ratio based on the total number of delivered orders since its joining.


select restaurant_id,
	   to_char(order_date, 'mm-yy') as month,
	   count(orders.order_id) as month_orders
from orders
join delivery 
on orders.order_id = delivery.order_id
where delivery_status = 'Delivered'
group by 1,2

















