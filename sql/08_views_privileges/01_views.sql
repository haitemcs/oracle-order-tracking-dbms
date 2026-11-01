-- ============================================================
-- VIEWS
-- Oracle SQL practice
-- Run this file in the C##OT schema.
-- ============================================================

-- Connect as SYS, then switch to the application schema.
-- SQL*Plus will prompt for the passwords.
CONNECT sys AS SYSDBA
CONNECT c##ot

-- ============================================================
-- 1. V_YEAR_OF_SERVICES
-- Shows each employee's full name, hire date, and years of service.
-- ============================================================

CREATE OR REPLACE VIEW V_year_of_services AS
SELECT
    employee_id,
    first_name || ' ' || last_name AS full_name,
    hire_date,
    FLOOR(MONTHS_BETWEEN(CURRENT_DATE, hire_date) / 12) AS years
FROM employees;

-- Check the view.
SELECT *
FROM V_year_of_services
ORDER BY employee_id;

-- ============================================================
-- 2. V_CUSTOMER_SALES
-- Shows the sales amount for each customer and year.
-- Only shipped orders are included.
-- ============================================================

CREATE OR REPLACE VIEW V_customer_sales AS
SELECT
    name AS customer,
    SUM(quantity * unit_price) AS sales_amount,
    EXTRACT(YEAR FROM order_date) AS sales_year
FROM orders
INNER JOIN order_items USING (order_id)
INNER JOIN customers USING (customer_id)
WHERE status = 'Shipped'
GROUP BY
    name,
    EXTRACT(YEAR FROM order_date);

-- Retrieve customer sales for 2017.
SELECT
    customer,
    sales_amount
FROM V_customer_sales
WHERE sales_year = 2017
ORDER BY sales_amount DESC;

-- ============================================================
-- 3. V_CUSTOMER_CREDITS
-- Read-only view of customer credit limits.
-- ============================================================

CREATE OR REPLACE VIEW V_customer_credits
    (customer_id, name, credit)
AS
SELECT
    customer_id,
    name,
    credit_limit
FROM customers
WITH READ ONLY;

-- Display customer credits.
SELECT *
FROM V_customer_credits
ORDER BY customer_id;

-- The view is read-only. UPDATE, INSERT, and DELETE operations
-- through this view are not allowed.
