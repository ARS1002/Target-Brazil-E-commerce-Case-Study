-- Query 5_a: Delivery Performance Metrics
SELECT
  order_id,
  DATETIME_DIFF(order_delivered_customer_date, order_purchase_timestamp, DAY) AS time_to_deliver,
  DATETIME_DIFF(order_delivered_customer_date, order_estimated_delivery_date, DAY) AS diff_estimated_delivery
FROM
  Target_SQL_BCase.orders
WHERE
  order_delivered_customer_date IS NOT NULL;

-- Query 5_b: Freight Cost Extremes by State
(SELECT
  c.customer_state,
  ROUND(AVG(oi.freight_value), 2) AS avg_freight_value
FROM
  Target_SQL_BCase.orders AS o
JOIN
  Target_SQL_BCase.customers AS c ON o.customer_id = c.customer_id
JOIN
  Target_SQL_BCase.order_items AS oi ON o.order_id = oi.order_id
GROUP BY
  c.customer_state
ORDER BY
  avg_freight_value DESC LIMIT 5)
UNION ALL
(SELECT
  c.customer_state,
  ROUND(AVG(oi.freight_value), 2) AS avg_freight_value
FROM
  Target_SQL_BCase.orders AS o
JOIN
  Target_SQL_BCase.customers AS c ON o.customer_id = c.customer_id
JOIN
  Target_SQL_BCase.order_items AS oi ON o.order_id = oi.order_id
GROUP BY
  c.customer_state
ORDER BY
  avg_freight_value ASC LIMIT 5);

-- Query 5_c: Delivery Time Extremes by State
(SELECT
  c.customer_state,
  ROUND(AVG(DATETIME_DIFF(o.order_delivered_customer_date, o.order_purchase_timestamp, DAY)), 2) AS avg_time_to_deliver
FROM
  Target_SQL_BCase.orders AS o
JOIN
  Target_SQL_BCase.customers AS c ON o.customer_id = c.customer_id
WHERE
  o.order_delivered_customer_date IS NOT NULL
GROUP BY
  c.customer_state
ORDER BY
  avg_time_to_deliver DESC LIMIT 5)
UNION ALL
(SELECT
  c.customer_state,
  ROUND(AVG(DATETIME_DIFF(o.order_delivered_customer_date, o.order_purchase_timestamp, DAY)), 2) AS avg_time_to_deliver
FROM
  Target_SQL_BCase.orders AS o
JOIN
  Target_SQL_BCase.customers AS c ON o.customer_id = c.customer_id
WHERE
  o.order_delivered_customer_date IS NOT NULL
GROUP BY
  c.customer_state
ORDER BY
  avg_time_to_deliver ASC LIMIT 5);

-- Query 5_d: Delivery vs. Estimate by State
SELECT
  c.customer_state,
  ROUND(AVG(DATE_DIFF(o.order_delivered_customer_date, o.order_estimated_delivery_date, DAY)), 0) AS avg_delivery_diff
FROM
  Target_SQL_BCase.orders AS o
JOIN
  Target_SQL_BCase.customers AS c ON o.customer_id = c.customer_id
WHERE
  o.order_delivered_customer_date IS NOT NULL
GROUP BY
  c.customer_state
ORDER BY
  avg_delivery_diff ASC LIMIT 5;
