SELECT o.status,
       COUNT(*) AS orders_count
FROM orders AS o
GROUP BY o.status
HAVING COUNT(*) > 3;

SELECT u.id,
       u.name,
       SUM(quantity * unit_price) AS total_spent
FROM users AS u
         JOIN orders AS o ON o.user_id = u.id
         JOIN order_items AS oi ON oi.order_id = o.id
GROUP BY u.id, u.name
HAVING SUM(quantity * unit_price) > 10000;

SELECT p.id,
       p.name,
       SUM(quantity) AS total_quantity
FROM products AS p
         JOIN order_items AS oi ON p.id = oi.product_id
WHERE oi.unit_price >= 1000
GROUP BY p.id, p.name;

SELECT u.id, u.name, o.status, COUNT(*) AS orders_count
FROM users AS u
         JOIN orders AS o ON o.user_id = u.id
GROUP BY u.id, u.name, o.status
HAVING COUNT(*) > 1;

SELECT o.id,
       SUM(oi.quantity) AS total_quantity
FROM orders AS o
         JOIN order_items AS oi ON oi.order_id = o.id
GROUP BY o.id
HAVING SUM(oi.quantity) > 4;

SELECT u.id,
       u.name,
       COUNT(*) AS paid_orders_count
FROM users AS u
         JOIN orders AS o ON o.user_id = u.id
WHERE o.status = 'PAID'
GROUP BY u.id, u.name
HAVING COUNT(*) > 1;

SELECT p.id,
       p.name,
       MIN(oi.unit_price) AS min_unit_price,
       MAX(oi.unit_price) AS max_unit_price
FROM products AS p
         JOIN order_items AS oi ON oi.product_id = p.id
GROUP BY p.id, p.name
HAVING MAX(oi.unit_price) > 5000;

SELECT o.status, AVG(oi.quantity * oi.unit_price) AS avg_line_total
FROM orders AS o
         JOIN order_items AS oi ON oi.order_id = oi.id
WHERE o.created_at >= DATE '2025-01-01'
GROUP BY o.status
HAVING AVG(oi.quantity * oi.unit_price) > 2000;
