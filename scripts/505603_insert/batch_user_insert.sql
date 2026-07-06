insert into users (name, email)
values
    ('Anna Smirnova', 'anna.smirnova@example.com'),
    ('Petr Ivanov', 'petr.ivanov@example.com'),
    ('Olga Sidorova', 'olga.sidorova@example.com')
returning id, name, email;

SELECT id, name, email, created_at
FROM users
ORDER BY id;