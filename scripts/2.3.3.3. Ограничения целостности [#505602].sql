CREATE TABLE roles
(
    id   INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name TEXT NOT NULL UNIQUE CHECK (char_length(name) > 0)
);

CREATE TABLE rules
(
    id   INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name TEXT NOT NULL UNIQUE CHECK (char_length(name) > 0)
);

CREATE TABLE users
(
    id            BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    role_id       INT         NOT NULL REFERENCES roles (id),
    login         TEXT        NOT NULL UNIQUE CHECK (char_length(login) > 3),
    password_hash TEXT        NOT NULL CHECK (char_length(password_hash) > 0),
    created_at    TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE states
(
    id   INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name TEXT NOT NULL UNIQUE DEFAULT 'NEW' CHECK (name IN ('NEW', 'IN_PROGRESS', 'DONE'))
);

CREATE TABLE categories
(
    id   INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name TEXT NOT NULL UNIQUE CHECK (char_length(name) > 0)
);

CREATE TABLE items
(
    id          BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name        TEXT        NOT NULL CHECK (char_length(name) > 0),
    description TEXT        NOT NULL CHECK (char_length(description) > 0),
    author_id   BIGINT      NOT NULL REFERENCES users (id),
    state_id    INT         NOT NULL REFERENCES states (id),
    category_id INT         NOT NULL REFERENCES states (id),
    created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE comments
(
    id         BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    content    TEXT        NOT NULL CHECK (char_length(content) > 0),
    author_id  BIGINT      NOT NULL REFERENCES users (id),
    item_id    BIGINT      NOT NULL REFERENCES items (id),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE roles_rules
(
    role_id INT REFERENCES roles (id),
    rule_id INT REFERENCES rules (id),
    PRIMARY KEY (role_id, rule_id)
);