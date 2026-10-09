SELECT 
    TO_CHAR(order_date, 'YYYY-MM') AS order_month,
    COUNT(*) AS total_orders,
    TO_CHAR(MIN(order_date), 'YYYY-MM-DD HH24:MI:SS') AS first_order_time,
    TO_CHAR(MAX(order_date), 'YYYY-MM-DD HH24:MI:SS') AS last_order_time
FROM 
    orders
GROUP BY 
    TO_CHAR(order_date, 'YYYY-MM')
ORDER BY 
    order_month ASC;
