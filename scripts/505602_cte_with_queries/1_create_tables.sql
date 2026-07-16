CREATE TABLE IF NOT EXISTS categories
(
    id        INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name      TEXT NOT NULL,
    parent_id INT REFERENCES categories (id)
);

CREATE TABLE IF NOT EXISTS products
(
    id          INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name        TEXT NOT NULL,
    category_id INT  NOT NULL REFERENCES categories (id),
    price       NUMERIC(12, 2)
);

CREATE TABLE IF NOT EXISTS order_items
(
    order_id   BIGINT NOT NULL,
    product_id INT    NOT NULL REFERENCES products (id),
    quantity   INT    NOT NULL
);

INSERT INTO categories (name, parent_id)
VALUES ('Электроника', NULL),
       ('Смартфоны', 1),
       ('Ноутбуки', 1),
       ('Аксессуары', 1),
       ('Чехлы', 4);

INSERT INTO products (name, category_id, price)
VALUES ('iPhone 17', 2, 123000),
       ('Air pods 2', 4, 23000),
       ('Macbook M2', 3, 223000);

INSERT INTO order_items (order_id, product_id, quantity)
VALUES (1, 1, 3),
       (1, 2, 1),
       (2, 2, 4);