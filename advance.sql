
SELECT * FROM order_details;
SELECT * FROM orders;
SELECT * FROM pizza_types;
SELECT * FROM pizzas;


-- Q1 -> Calculate the percentage contribution of each pizza type to total revenue
SELECT
    pt.name AS pizza_type,
    ROUND(
        SUM(p.price * od.quantity) * 100.0 /
        (
            SELECT SUM(p2.price * od2.quantity)
            FROM order_details od2
            JOIN pizzas p2
                ON p2.pizza_type_id = od2.pizza_id
        ),
        2
    ) AS revenue_pct
FROM order_details od
JOIN pizzas p
    ON p.pizza_type_id = od.pizza_id
JOIN pizza_types pt
    ON pt.pizza_type_id = p.pizza_name
GROUP BY pt.name
ORDER BY revenue_pct DESC;

SELECT
    pt.category,
    ROUND(
        SUM(p.price * od.quantity) * 100.0 /
        (
            SELECT SUM(p2.price * od2.quantity)
            FROM order_details od2
            JOIN pizzas p2
                ON p2.pizza_type_id = od2.pizza_id
        ),
        2
    ) AS revenue_pct
FROM order_details od
JOIN pizzas p
    ON p.pizza_type_id = od.pizza_id
JOIN pizza_types pt
    ON pt.pizza_type_id = p.pizza_name
GROUP BY pt.category
ORDER BY revenue_pct DESC;

-- Q2 ANALYZE the cumulative revenue generated over time ;

-- 200   200
-- 300   500
-- 200   700
-- 400   1100
SELECT * FROM order_details;
SELECT * FROM orders;
SELECT * FROM pizza_types;
SELECT * FROM pizzas;



SELECT eld1,sum(revenue) OVER (order by eld1) as cum_sum
FROM
(select orders.order_date as eld1 ,SUM(pizzas.price * order_details.quantity) as revenue
FROM order_details JOIN 
orders ON order_details.order_id = orders.order_id
JOIN pizzas ON pizzas.pizza_type_id = order_details.pizza_id
GROUP BY eld1) 
as sales;


-- Q3 -> Determine the top 3 most ordered pizza types based on revenue for each pizza category
WITH pizza_revenue AS (
    SELECT
        pt.category,
        pt.name AS pizza_type,
        SUM(p.price * od.quantity) AS revenue
    FROM order_details od
    JOIN pizzas p
        ON p.pizza_type_id = od.pizza_id
    JOIN pizza_types pt
        ON pt.pizza_type_id = p.pizza_name
    GROUP BY pt.category, pt.name
),
ranked AS (
    SELECT
        category,
        pizza_type,
        ROUND(revenue, 2) AS revenue,
        RANK() OVER (PARTITION BY category ORDER BY revenue DESC) AS rnk
    FROM pizza_revenue
)
SELECT category, pizza_type, revenue, rnk
FROM ranked
WHERE rnk <= 3
ORDER BY category, rnk;































