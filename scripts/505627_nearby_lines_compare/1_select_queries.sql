WITH daily_sales AS (SELECT date(o.created_at)            AS sale_date,
                            SUM(oi.quantity * unit_price) AS sale_total
                     FROM orders AS o
                              JOIN order_items AS oi ON oi.order_id = o.id
                     GROUP BY date(o.created_at)),
     prev_day_sale_total AS (SELECT ds.sale_date,
                                    ds.sale_total,
                                    LAG(sale_total) OVER (
                                        ORDER BY ds.sale_date
                                        ) AS prev_day_total
                             FROM daily_sales AS ds)
SELECT ds.sale_date      AS sale_date,
       ds.sale_total     AS sales_amount,
       ds.prev_day_total AS previous_day_sales,
       LEAD(sale_total) OVER (
           ORDER BY ds.sale_date
           )             AS next_day_sales,
       ROUND(
               (ds.sale_total - ds.prev_day_total) * 100.0
                   / ds.prev_day_total,
               2
       )                 AS sales_diff,
       SUM(ds.sale_total) OVER (
           ORDER BY ds.sale_date
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
           )             AS running_total,
       AVG(ds.sale_total) OVER (
           ORDER BY ds.sale_date
           ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
           )             AS avg_last_three_days
FROM prev_day_sale_total AS ds
ORDER BY ds.sale_date