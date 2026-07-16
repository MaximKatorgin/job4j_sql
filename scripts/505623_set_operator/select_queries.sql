SELECT user_id
FROM orders
WHERE status = 'PAID'
UNION
SELECT user_id
FROM orders
WHERE status = 'NEW';

SELECT 'user'     AS entity_type,
       id         AS entity_id,
       created_at AS created_at
FROM users
UNION ALL
SELECT 'product'  AS entity_type,
       id         AS entity_id,
       created_at AS created_at
FROM products
UNION ALL
SELECT 'order'    AS entity_type,
       id         AS entity_id,
       created_at AS created_at
FROM orders;

SELECT id, name
FROM products
WHERE is_active = TRUE
INTERSECT
SELECT p.id, p.name
FROM products AS p
         JOIN order_items AS oi ON oi.product_id = p.id;

SELECT id, name
FROM products
WHERE is_active = TRUE
EXCEPT
SELECT p.id, p.name
FROM products AS p
         JOIN order_items AS oi ON oi.product_id = p.id;

SELECT u.id, u.name
FROM users AS u
WHERE created_at > DATE '2025-01-01'
UNION
SELECT u.id, u.name
FROM users AS u
         JOIN orders AS o ON o.user_id = u.id;

SELECT p.id, p.name, p.price
FROM products AS p
WHERE p.price > (SELECT AVG(price) FROM products)
INTERSECT
SELECT p.id, p.name, p.price
FROM products AS p
         JOIN order_items AS oi ON oi.product_id = p.id;

SELECT u.id, u.name
FROM users AS u
         JOIN orders AS o ON o.user_id = u.id
EXCEPT
SELECT u.id, u.name
FROM users AS u
         JOIN orders AS o ON o.user_id = u.id
WHERE o.status = 'CANCELLED';

SELECT 'user' AS entity_type, id AS entity_id, name AS display_name
FROM users
UNION ALL
SELECT 'product' AS entity_type, id AS entity_id, name AS display_name
FROM products;




