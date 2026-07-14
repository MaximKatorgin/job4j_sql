SELECT p.id,
       p.name,
       p.price
FROM products AS p
WHERE p.price > (SELECT AVG(price) FROM products);

SELECT u.id,
       u.name,
       u.email
FROM users AS u
WHERE EXISTS(SELECT 1 FROM orders WHERE orders.user_id = u.id);

SELECT u.id,
       u.name,
       u.email
FROM users AS u
WHERE NOT EXISTS(SELECT 1 FROM orders WHERE orders.user_id = u.id);

SELECT p.id,
       p.name,
       p.price
FROM products AS p
WHERE p.id IN (SELECT oi.product_id FROM order_items AS oi);

SELECT o.id,
       t.order_total
FROM orders AS o
         JOIN (SELECT oi.order_id,
                      SUM(quantity * unit_price) AS order_total
               FROM order_items AS oi
               GROUP BY oi.order_id) AS t ON t.order_id = o.id
WHERE t.order_total > 10_000;

SELECT u.id,
       u.name,
       (SELECT COUNT(*) FROM orders AS o WHERE o.user_id = u.id) AS orders_count
FROM users AS u;

SELECT oi.product_id, SUM(quantity)
FROM order_items AS oi
GROUP BY oi.product_id
HAVING SUM(quantity) > (SELECT AVG(quantity)
                        FROM order_items AS avg_order_items
                        WHERE avg_order_items.product_id = oi.product_id
                        GROUP BY avg_order_items.product_id);


SELECT oi.product_id,
       SUM(quantity) AS total_quantity
FROM order_items AS oi
GROUP BY oi.product_id
HAVING SUM(quantity) > (SELECT AVG(quantity_sum)
                        FROM (SELECT SUM(order_items.quantity) AS quantity_sum
                              FROM order_items
                              GROUP BY order_items.product_id) AS orders_cnt);

SELECT summed_orders.order_id,
       summed_orders.order_total
FROM (SELECT oi.order_id                      AS order_id,
             SUM(oi.quantity * oi.unit_price) AS order_total
      FROM order_items AS oi
      GROUP BY oi.order_id) AS summed_orders
WHERE summed_orders.order_total > (SELECT AVG(order_items.quantity * order_items.unit_price)
                                   FROM order_items)