-- Query 2_a: Year-Over-Year Growth
SELECT
  EXTRACT (YEAR FROM order_purchase_timestamp) AS order_year,
  COUNT (order_id) AS total_orders
FROM
  Target_SQL_BCase.orders
GROUP BY
  order_year
ORDER BY
  order_year;

-- Query 2_b: Monthly Seasonality
SELECT
  FORMAT_TIMESTAMP('%m', order_purchase_timestamp) AS year_month,
  COUNT (order_id) AS total_orders
FROM
  Target_SQL_BCase.orders
GROUP BY
  year_month
ORDER BY
  year_month;

-- Query 2_c: Daily Purchase Behavior
SELECT
  CASE
    WHEN EXTRACT(HOUR FROM order_purchase_timestamp) BETWEEN 0 AND 6 THEN 'Dawn'
    WHEN EXTRACT(HOUR FROM order_purchase_timestamp) BETWEEN 7 AND 12 THEN 'Morning'
    WHEN EXTRACT(HOUR FROM order_purchase_timestamp) BETWEEN 13 AND 18 THEN 'Afternoon'
    ELSE 'Night'
  END AS time_of_day,
  COUNT (order_id) AS total_orders
FROM
  Target_SQL_BCase.orders
GROUP BY
  time_of_day
ORDER BY
  total_orders DESC;
