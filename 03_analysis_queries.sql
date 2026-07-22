-- =====================================================
-- RETAIL SALES ANALYTICS PROJECT
-- File 3: Analysis Queries
-- Har query ke upar business question comment mein hai
-- =====================================================

-- 1. Total revenue (sirf Completed orders se)
SELECT 
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS total_revenue
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
WHERE o.status = 'Completed';


-- 2. Total number of orders by status
SELECT 
    status, 
    COUNT(*) AS order_count
FROM orders
GROUP BY status;


-- 3. Top 5 best-selling products (by quantity sold)
SELECT 
    p.product_name,
    SUM(oi.quantity) AS total_units_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.status = 'Completed'
GROUP BY p.product_name
ORDER BY total_units_sold DESC
LIMIT 5;


-- 4. Revenue by product category
SELECT 
    p.category,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS category_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.status = 'Completed'
GROUP BY p.category
ORDER BY category_revenue DESC;


-- 5. Top 5 customers by total spend
SELECT 
    c.customer_name,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS total_spent
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.status = 'Completed'
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 5;


-- 6. Monthly revenue trend
SELECT 
    strftime('%Y-%m', o.order_date) AS month,   -- MySQL me: DATE_FORMAT(o.order_date, '%Y-%m')
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS monthly_revenue
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
WHERE o.status = 'Completed'
GROUP BY month
ORDER BY month;


-- 7. City-wise number of customers
SELECT 
    city, 
    COUNT(*) AS customer_count
FROM customers
GROUP BY city
ORDER BY customer_count DESC;


-- 8. Average order value (AOV)
SELECT 
    ROUND(SUM(oi.quantity * oi.unit_price) / COUNT(DISTINCT o.order_id), 2) AS avg_order_value
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
WHERE o.status = 'Completed';


-- 9. Customers who never placed an order (LEFT JOIN + NULL check)
SELECT 
    c.customer_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;


-- 10. Cancelled order rate (%)
SELECT 
    ROUND(
        100.0 * SUM(CASE WHEN status = 'Cancelled' THEN 1 ELSE 0 END) / COUNT(*), 
    2) AS cancelled_rate_percent
FROM orders;


-- 11. Repeat customers (customers with more than 1 completed order)
SELECT 
    c.customer_name,
    COUNT(o.order_id) AS order_count
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.status = 'Completed'
GROUP BY c.customer_name
HAVING COUNT(o.order_id) > 1
ORDER BY order_count DESC;


-- 12. Products that were never ordered (subquery)
SELECT 
    product_name
FROM products
WHERE product_id NOT IN (SELECT DISTINCT product_id FROM order_items);


-- 13. Rank customers by spend (window function)
SELECT 
    c.customer_name,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS total_spent,
    RANK() OVER (ORDER BY SUM(oi.quantity * oi.unit_price) DESC) AS spend_rank
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.status = 'Completed'
GROUP BY c.customer_name;


-- 14. Running total of revenue by month (window function)
SELECT 
    month,
    monthly_revenue,
    SUM(monthly_revenue) OVER (ORDER BY month) AS running_total
FROM (
    SELECT 
        strftime('%Y-%m', o.order_date) AS month,
        SUM(oi.quantity * oi.unit_price) AS monthly_revenue
    FROM order_items oi
    JOIN orders o ON oi.order_id = o.order_id
    WHERE o.status = 'Completed'
    GROUP BY month
) monthly_data;


-- 15. State-wise revenue contribution
SELECT 
    c.state,
    ROUND(SUM(oi.quantity * oi.unit_price), 2) AS state_revenue
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.status = 'Completed'
GROUP BY c.state
ORDER BY state_revenue DESC;
