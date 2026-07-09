SELECT id, name, email
FROM users
WHERE email LIKE '%mail%';

SELECT id, name, price
FROM products
WHERE name LIKE '%air%';

SELECT id, name, price
FROM products
WHERE name LIKE 'i%';

SELECT id, name, price
FROM products
WHERE name LIKE '%pro';

SELECT id, name, email
FROM users
WHERE name ILIKE 'a%'
   or name ILIKE 'i%';

SELECT id, title, company, description
FROM vacancies
WHERE title ~* '(java|go|postgres)'
   or description ~* '(java|go|postgres)';

SELECT id, name, price
FROM products
WHERE name ~ '^iPhone [1-9]+$';

