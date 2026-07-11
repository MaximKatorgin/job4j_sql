SELECT users.id, users.name, COUNT(orders.id)
FROM users
         LEFT JOIN orders ON users.id = orders.user_id
GROUP BY users.id, users.name;

SELECT o.id, o.status, o.created_at
FROM orders AS o
         LEFT JOIN payments AS p ON p.order_id = o.id
WHERE p.id IS NULL;

SELECT p.id, p.name, COUNT(oi.id)
FROM products AS p
         LEFT JOIN order_items AS oi ON oi.product_id = p.id
GROUP BY p.id, p.name
HAVING COUNT(oi.id) > 1;

SELECT r.code, COUNT(ur.user_id)
FROM roles AS r
         LEFT JOIN user_roles AS ur ON ur.role_id = r.id
GROUP BY r.code
ORDER BY r.code;

SELECT name, email
FROM users AS u
         LEFT JOIN user_roles AS ur ON u.id = ur.user_id
WHERE ur.role_id IS NULL;

SELECT r.code, ur.user_id
FROM roles AS r
         FULL JOIN user_roles AS ur ON r.id = ur.role_id;

SELECT r.code, e.code
FROM roles AS r
         CROSS JOIN environments AS e;

SELECT c.name, p.name
FROM categories AS c
         LEFT JOIN categories AS p ON c.parent_id = p.id;