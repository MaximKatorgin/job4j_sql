SELECT id, name, price, is_active
FROM products
WHERE is_active = true;

SELECT id, name, price
FROM products
WHERE price BETWEEN 10_000 AND 100_000;

SELECT id, user_id, status, created_at
FROM orders
WHERE status IN ('NEW', 'PAID');

SELECT id, user_id, status, created_at
FROM orders
WHERE user_id = 1
  AND status <> 'CANCELLED';

SELECT id, name, email, created_at
FROM users
WHERE created_at BETWEEN
          DATE '2026-01-01' AND
          DATE '2027-01-01';

SELECT id, name, price
FROM products
WHERE price < 20_000
   OR price > 80_000;

SELECT id, name, price
FROM products
WHERE is_active = true
  AND (price < 3_000 OR price > 150_000)




