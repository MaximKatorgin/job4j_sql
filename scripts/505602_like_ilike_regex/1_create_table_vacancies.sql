CREATE TABLE vacancies
(
    id          BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title       TEXT        NOT NULL,
    company     TEXT        NOT NULL,
    description TEXT,
    created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

INSERT INTO vacancies (title, company, description)
VALUES ('Go developer', 'company 1', null),
       ('Developer', 'company 2', 'java or postgres accepted'),
       ('Rust backend', 'company 3', null);