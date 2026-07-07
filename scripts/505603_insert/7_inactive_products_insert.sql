INSERT INTO inactive_products_archive
    (product_id, product_name, price)
SELECT p.id, p.name, p.price
FROM products p
WHERE p.is_active = false
RETURNING *;
