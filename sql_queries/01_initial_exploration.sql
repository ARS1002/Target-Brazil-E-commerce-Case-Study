-- Query 1_a: Data Structure of Customers Table
SELECT
  column_name,
  data_type
FROM
  Target_SQL_BCase.INFORMATION_SCHEMA.COLUMNS
WHERE
  table_name = 'customers';

-- Query 1_b: Time Horizon of Orders
SELECT
  MIN(order_purchase_timestamp) AS first_order_date,
  MAX(order_purchase_timestamp) AS last_order_date,
  COUNT (order_id) AS total_orders,
  DATETIME_DIFF(MAX(order_purchase_timestamp), MIN(order_purchase_timestamp), DAY) AS DAYS
FROM
  Target_SQL_BCase.orders;

-- Query 1_c: Geographic Scope
SELECT
  COUNT(DISTINCT customer_city) AS number_of_cities,
  COUNT(DISTINCT customer_state) AS number_of_states
FROM
  Target_SQL_BCase.customers;
