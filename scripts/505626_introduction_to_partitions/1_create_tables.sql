create table if not exists employees (
                                         id     integer primary key,
                                         name  text,
                                         city text,
                                         department text,
                                         salary  integer
);

insert into employees (id, name, city, department, salary)
values
    (11, 'Дарья', 'Самара', 'hr', 70),
    (12, 'Борис', 'Самара', 'hr', 78),
    (21, 'Елена', 'Самара', 'it', 84),
    (22, 'Ксения', 'Москва', 'it', 90),
    (23, 'Леонид', 'Самара', 'it', 104),
    (24, 'Марина', 'Москва', 'it', 104),
    (25, 'Иван', 'Москва', 'it', 120),
    (31, 'Вероника', 'Москва', 'sales', 96),
    (32, 'Григорий', 'Самара', 'sales', 96),
    (33, 'Анна', 'Москва', 'sales', 100)
;