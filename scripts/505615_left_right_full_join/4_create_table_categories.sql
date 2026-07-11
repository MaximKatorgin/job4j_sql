CREATE TABLE categories
(
    id        BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name      TEXT NOT NULL,
    parent_id BIGINT REFERENCES categories (id)
);

INSERT INTO categories (name, parent_id)
VALUES ('Электроника', NULL),
       ('Смартфоны', 1),
       ('Ноутбуки', 1),
       ('Аксессуары', 1),
       ('Чехлы', 4);