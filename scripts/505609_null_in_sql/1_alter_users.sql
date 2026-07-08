ALTER TABLE users
    ADD COLUMN IF NOT EXISTS phone       TEXT NULL,
    ADD COLUMN IF NOT EXISTS middle_name TEXT NULL;

INSERT INTO users (name, email, phone, middle_name)
VALUES ('Anton Ivanov', 'anton@mail.ru', null, 'Ivanovich'),
       ('Dmitri Alexandrov', 'dmitrii@mail.ru', '+79462438741', null)
