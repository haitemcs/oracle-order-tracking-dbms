describe orders;

SELECT salesman_id, 
    COUNT(*) AS total_orders,
    SUM(CASE WHEN status = 'Shipped' THEN 1 ELSE 0 END) AS shipped_orders,
    SUM(CASE WHEN status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled_orders,
    SUM(CASE WHEN status = 'Pending' THEN 1 ELSE 0 END) AS in_process_orders
 FROM orders
 GROUP BY salesman_id
 ORDER BY total_orders DESC, salesman_id ASC;
