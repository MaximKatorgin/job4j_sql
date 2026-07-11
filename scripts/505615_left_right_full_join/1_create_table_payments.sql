CREATE TABLE payments
(
    id         BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    order_id   BIGINT         NOT NULL REFERENCES orders (id),
    amount     NUMERIC(12, 2) NOT NULL CHECK (amount > 0),
    status     TEXT           NOT NULL,
    created_at TIMESTAMPTZ    NOT NULL DEFAULT NOW()
);

INSERT INTO payments (order_id, amount, status)
VALUES (1, 129990.00, 'PAID'),
       (3, 4990.00, 'FAILED');