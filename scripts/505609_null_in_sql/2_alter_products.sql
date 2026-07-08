ALTER TABLE products
    ADD COLUMN IF NOT EXISTS description    TEXT           NULL,
    ADD COLUMN IF NOT EXISTS discount_price NUMERIC(12, 2) NULL;

UPDATE products
SET description = 'To old to sold'
WHERE id = 4;

UPDATE products
SET discount_price = price * 0.95
WHERE is_active = true;