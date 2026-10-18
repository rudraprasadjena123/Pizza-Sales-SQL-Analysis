-- Q1 -> Join the necessary tables to find the total quantity of each pizza catagory order

select * from orders;
select * from pizza_types;
select * from order_details;
select * from pizzas;


select pizza_types.category,sum(order_details.quantity) as odl1
FROM pizza_types JOIN
pizzas ON pizza_types.pizza_type_id = pizzas.pizza_name
join order_details ON 
order_details.pizza_id = pizzas.pizza_type_id group by
pizza_types.category 
order by odl1  desc;


-- Q3 -> Determines the distribution of orders by hour of the day;


select hour(order_time) as adl1 , count(order_id) as adl2 from orders 
GROUP BY adl1;


-- Join relevant tables to find the category wise distribution of pizzas;

-- SELECT category ,count(quantity) as cou FROM pizza_types
-- JOIN pizzas on pizza_types.pizza_type_id = pizzas.pizza_name
-- JOIN order_details on order_details.pizza_id = pizzas.pizza_type_id
-- GROUP BY category 
-- ORDER BY cou DESC;

select category , count(name) from pizza_types
GROUP by category;

-- Q -> Group the orders by date and calculate the average number of pizzas ordered per day;


SELECT avg(quantity) FROM
(select orders.order_date as eld1 ,sum(order_details.quantity) as quantity
from orders join order_details
ON orders.order_id = order_details.order_id
GROUP BY eld1) AS order_quantity;

-- Q-> Determine the top 3 most ordered pizza types based on the revenue

select pizza_types.name as dle1 , sum(order_details .quantity*pizzas.price) as revenue
from pizza_types join pizzas
on pizzas.pizza_name = pizza_types.pizza_type_id
join order_details
on order_details.pizza_id = pizzas.pizza_type_id
group by dle1
ORDER BY revenue DESC
LIMIT 3;







