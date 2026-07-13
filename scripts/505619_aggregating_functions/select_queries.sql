SELECT status,
       COUNT(*) AS orders_count
FROM orders
GROUP BY status;

SELECT u.id,
       u.name,
       SUM(oi.quantity * oi.unit_price) AS total_spent
FROM users AS u
         LEFT JOIN orders AS o ON u.id = o.user_id
         LEFT JOIN order_items AS oi ON oi.order_id = o.id
GROUP BY u.id, u.name;

SELECT p.id,
       p.name,
       COUNT(oi.order_id) AS order_items_count,
       SUM(oi.quantity)   AS total_quantity
FROM products AS p
         LEFT JOIN order_items AS oi ON oi.product_id = p.id
GROUP BY p.id, p.name;

SELECT o.id,
       COUNT(oi.id)                  AS items_count,
       SUM(oi.unit_price * quantity) AS order_total
FROM orders AS o
         LEFT JOIN order_items AS oi ON oi.order_id = o.id
GROUP BY o.id;

SELECT u.id,
       u.name,
       o.status,
       COUNT(o.id)
FROM users AS u
         LEFT JOIN orders AS o ON u.id = o.user_id
GROUP BY u.id, u.name, o.status;

SELECT p.id,
       p.name,
       MIN(oi.unit_price) AS min_unit_price,
       MAX(oi.unit_price) AS max_unit_price,
       AVG(oi.unit_price) AS avg_unit_price
FROM products AS p
         LEFT JOIN order_items AS oi ON oi.product_id = p.id
GROUP BY p.id, p.name;

SELECT u.id,
       u.name,
       COUNT(o.id) AS orders_count
FROM users AS u
         LEFT JOIN orders AS o ON o.user_id = u.id
GROUP BY u.id, u.name;




