WITH category_total AS (SELECT p.id,
                               p.category_id,
                               SUM(oi.quantity * p.price) AS category_total
                        FROM products AS p
                                 JOIN order_items AS oi ON oi.product_id = p.id
                        GROUP BY p.id, p.category_id),
     category_avg AS (SELECT AVG(ct.category_total) AS category_avg
                      FROM products AS p
                               JOIN category_total AS ct ON ct.id = p.id)
SELECT c.id, c.name, ct.category_total
FROM category_total AS ct
         JOIN categories AS c ON c.id = ct.category_id
WHERE ct.category_total > (SELECT ca.category_avg FROM category_avg AS ca);

WITH RECURSIVE hierarchy AS (SELECT c.id, c.name, c.parent_id, 1 AS level
                             FROM categories AS c
                             WHERE id = 1
                             UNION ALL
                             SELECT c.id,
                                    c.name,
                                    c.parent_id,
                                    h.level + 1
                             FROM categories AS c
                                      JOIN hierarchy AS h ON h.id = c.parent_id)
SELECT *
FROM hierarchy
ORDER BY level;
