SELECT cb.id,
       cb.name
FROM car_bodies AS cb
         LEFT JOIN cars AS c ON c.body_id = cb.id
WHERE c.id IS NULL;

SELECT ce.id,
       ce.name
FROM car_engines AS ce
         LEFT JOIN cars AS c ON c.engine_id = ce.id
WHERE c.id IS NULL;

SELECT ct.id,
       ct.name
FROM car_transmissions AS ct
         LEFT JOIN cars AS c ON c.transmission_id = ct.id
WHERE c.id IS NULL;

SELECT c.id,
       c.name,
       cb.name
FROM cars AS c
         LEFT JOIN car_bodies AS cb ON c.body_id = cb.id
WHERE cb.id IS NOT NULL;

SELECT c.id,
       c.name,
       cb.name,
       ce.name,
       ct.name
FROM cars AS c
         INNER JOIN car_bodies AS cb ON cb.id = c.body_id
         INNER JOIN car_engines AS ce ON ce.id = c.engine_id
         INNER JOIN car_transmissions AS ct ON ct.id = c.transmission_id;

SELECT c.id,
       c.name,
       ce.name,
       cb.name
FROM cars AS c
         INNER JOIN car_engines AS ce ON ce.id = c.engine_id
         LEFT JOIN car_bodies AS cb ON cb.id = c.body_id
WHERE cb.id IS NULL;

SELECT cb.id,
       cb.name,
       c.id,
       c.name
FROM car_bodies AS cb
         LEFT JOIN cars AS c ON c.body_id = cb.id;

SELECT ce.id, ce.name
FROM car_engines AS ce
         LEFT JOIN cars AS c ON c.engine_id = ce.id
WHERE c.id IS NULL;

SELECT c.id,
       c.name,
       cb.name,
       ce.name,
       ct.name
FROM cars AS c
         LEFT JOIN car_bodies AS cb ON cb.id = c.body_id
         LEFT JOIN car_engines AS ce ON ce.id = c.engine_id
         LEFT JOIN car_transmissions AS ct ON ct.id = c.transmission_id
WHERE ct.name LIKE 'automatic%';

SELECT c.id,
       c.name,
       cb.name,
       ce.name,
       ct.name
FROM cars AS c
         LEFT JOIN car_bodies AS cb ON cb.id = c.body_id
         LEFT JOIN car_engines AS ce ON ce.id = c.engine_id
         LEFT JOIN car_transmissions AS ct ON ct.id = c.transmission_id
WHERE cb.id IS NULL
   OR ce.id IS NULL
   OR ct.id IS NULL;

SELECT c.id,
       c.name,
       ce.name,
       ct.name
FROM cars AS c
         INNER JOIN car_engines AS ce ON ce.id = c.engine_id
         LEFT JOIN car_transmissions AS ct ON ct.id = c.transmission_id;

SELECT 'transmission' AS name,
       ct.id,
       ct.name
FROM car_transmissions AS ct
         LEFT JOIN cars AS c ON ct.id = c.transmission_id
WHERE c.id IS NULL

UNION

SELECT 'engine' AS name,
       ce.id,
       ce.name
FROM car_engines AS ce
         LEFT JOIN cars AS c ON ce.id = c.engine_id
WHERE c.id IS NULL

UNION

SELECT 'body' AS name,
       cb.id,
       cb.name
FROM car_bodies AS cb
         LEFT JOIN cars AS c ON cb.id = c.body_id
WHERE c.id IS NULL;


SELECT c.id,
       c.name,
       cb.name,
       ce.name,
       ct.name
FROM cars AS c
         LEFT JOIN car_bodies AS cb ON cb.id = c.body_id
         LEFT JOIN car_engines AS ce ON ce.id = c.engine_id
         LEFT JOIN car_transmissions AS ct ON ct.id = c.transmission_id
WHERE cb.name IN ('sedan', 'hatchback', 'suv');
