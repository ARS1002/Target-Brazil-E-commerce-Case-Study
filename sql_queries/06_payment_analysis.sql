-- Query 6_a: Preferred Payment Methods
SELECT
  FORMAT_TIMESTAMP('%Y-%m', o.order_purchase_timestamp) AS month,
  p.payment_type,
  COUNT(o.order_id) AS num_of_orders
FROM
  Target_SQL_BCase.orders AS o
JOIN
  Target_SQL_BCase.payments AS p ON o.order_id = p.order_id
GROUP BY
  month,
  p.payment_type
ORDER BY
  month,
  p.payment_type;

-- Query 6_b: Payment Installments Analysis
SELECT
  payment_installments,
  COUNT (order_id) AS number_of_orders
FROM
  Target_SQL_BCase.payments
GROUP BY
  payment_installments
ORDER BY
  payment_installments;
