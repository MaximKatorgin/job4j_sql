SELECT ranked.name,
       ranked.department,
       ranked.salary
FROM (SELECT e.name,
             e.department,
             e.salary,
             ROW_NUMBER() OVER w AS rank
      FROM public.employees AS e
      WINDOW w AS (PARTITION BY e.department
              ORDER BY salary DESC)) AS ranked
WHERE ranked.rank = 1
