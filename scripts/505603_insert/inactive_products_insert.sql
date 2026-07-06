insert into inactive_products_archive
    (product_id, product_name, price)
select p.id, p.name, p.price
from products p
where p.is_active = false
returning *;
