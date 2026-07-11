CREATE TABLE environments
(
    id   BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    code TEXT NOT NULL UNIQUE
);

INSERT INTO environments (code)
VALUES ('dev'), ('stage'), ('prod');