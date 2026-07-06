drop table if exists inactive_products_archive;

create table inactive_products_archive
(
    id           BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    product_id   BIGINT         NOT NULL,
    product_name TEXT           NOT NULL,
    price        NUMERIC(12, 2) NOT NULL,
    archived_at  TIMESTAMPTZ    NOT NULL DEFAULT now()
);