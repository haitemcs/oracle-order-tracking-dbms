
describe orders;

SELECT customer_id, COUNT(order_id) AS total_orders, MIN(order_date) AS first_order_date , MAX(order_date) AS last_order_date
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) >= 3
ORDER BY COUNT(order_id) DESC, customer_id DESC;

--$$\text{FROM} \longrightarrow \text{WHERE} \longrightarrow \text{GROUP BY} \longrightarrow \text{HAVING} \longrightarrow \text{SELECT} \longrightarrow \text{ORDER BY} \longrightarrow \text{FETCH/OFFSET}$$
