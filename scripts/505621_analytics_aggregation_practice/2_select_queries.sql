SELECT o.customer_name,
       SUM(oi.quantity * p.price) AS total_revenue
FROM order_items AS oi
         JOIN orders AS o ON oi.order_id = o.order_id
         JOIN products AS p ON p.product_id = oi.product_id
WHERE o.status = 'completed'
GROUP BY o.customer_name
ORDER BY total_revenue DESC
LIMIT 2;

SELECT p.category,
       SUM(oi.quantity)           AS total_items_sold,
       SUM(oi.quantity * p.price) AS category_revenue
FROM order_items AS oi
         JOIN orders AS o ON o.order_id = oi.order_id
         JOIN products AS p ON p.product_id = oi.product_id
GROUP BY p.category
HAVING SUM(oi.quantity * p.price) > 30_000;

WITH order_items_count AS (SELECT COUNT(*) AS items_count
                           FROM order_items AS oi
                                    JOIN orders AS o ON o.order_id = oi.order_id
                           GROUP BY oi.order_id)
SELECT AVG(items_count) AS avg_items_per_order
FROM order_items_count;