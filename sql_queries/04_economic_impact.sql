-- Query 4_a: Growth in Sales Revenue
with yearly_sales AS( 
  SELECT 
      EXTRACT(YEAR FROM o.order_purchase_timestamp) AS order_year, 
      SUM(p.payment_value) AS total_sales, 
    FROM 
      `scaler-sql-467515.Target_SQL_BCase.orders` AS o 
    JOIN 
      `Target_SQL_BCase.payments` AS p on o.order_id = p.order_id 
    WHERE  
        EXTRACT(YEAR FROM o.order_purchase_timestamp) IN (2017, 2018) 
        AND EXTRACT(MONTH FROM o.order_purchase_timestamp) BETWEEN 1 and 8 
    GROUP BY order_year 
  ) 
SELECT 
  y2017.total_sales AS sales_2017, 
  y2018.total_sales AS sales_2018, 
  ROUND(((y2018.total_sales - y2017.total_sales)* 100/ y2017.total_sales), 2 )AS 
Percentage_Increase 
FROM (SELECT total_sales FROM yearly_sales WHERE order_year = 2017) AS y2017, 
      (SELECT total_sales FROM yearly_sales WHERE order_year = 2018) AS y2018; 

-- Query 4_b: Order Value by State
SELECT
  c.customer_state,
  ROUND(SUM(p.payment_value), 2) AS total_order_value,
  ROUND(AVG(p.payment_value), 2) AS avg_order_value
FROM
  Target_SQL_BCase.orders AS o
JOIN
  Target_SQL_BCase.customers AS c ON o.customer_id = c.customer_id
JOIN
  Target_SQL_BCase.payments AS p ON o.order_id = p.order_id
GROUP BY
  c.customer_state
ORDER BY
  total_order_value DESC;

-- Query 4_c: Freight Value by State
SELECT
  c.customer_state,
  ROUND(SUM(oi.freight_value), 2) AS total_freight_value,
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
  total_freight_value DESC;
