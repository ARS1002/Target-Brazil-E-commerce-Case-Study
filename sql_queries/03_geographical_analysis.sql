-- Query 3_a: Customer Distribution Across States
SELECT
  FORMAT_TIMESTAMP('%Y-%m', o.order_purchase_timestamp) AS month,
  c.customer_state,
  COUNT(o.order_id) AS total_orders
FROM
  Target_SQL_BCase.orders AS o
JOIN
  Target_SQL_BCase.customers AS c ON o.customer_id = c.customer_id
GROUP BY
  month,
  c.customer_state
ORDER BY
  c.customer_state,
  month;

-- Query 3_b: State-Level Order Trends
SELECT
  customer_state,
  COUNT (customer_id) AS total_customers
FROM
  Target_SQL_BCase.customers
GROUP BY
  customer_state
ORDER BY
  total_customers DESC;
