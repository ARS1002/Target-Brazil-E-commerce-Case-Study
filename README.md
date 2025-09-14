## E-commerce Performance Analysis: Target in Brazil (2016-2018)
#Executive Summary
This report provides a comprehensive analysis of 100,000 e-commerce orders in Brazil between September 2016 and October 2018. The analysis reveals significant year-over-year growth in both order volume and sales value, indicating strong market adoption. While the customer base is heavily concentrated in the southeastern states like São Paulo, there are major regional disparities in logistics. Key findings show that northern states face significantly higher freight costs and longer delivery times, presenting a critical area for operational improvement. Based on these insights, this report provides actionable recommendations focused on optimizing logistics, refining marketing efforts, and enhancing payment solutions to align with consumer behavior.

#1. Initial Data Exploration & Characteristics
Key Findings & Insights
Time Horizon: The dataset covers approximately two years (772 days) from September 2016 to October 2018, encompassing 99,441 orders.

Geographic Scope : The business has a nationwide presence, operating across all 27 states and in over 4,000 distinct cities in Brazil.

SQL Query: Date Range and Order Volume
SELECT
    MIN(order_purchase_timestamp) AS first_order_date,
    MAX(order_purchase_timestamp) AS last_order_date,
    COUNT(order_id) AS total_orders,
    DATETIME_DIFF(MAX(order_purchase_timestamp), MIN(order_purchase_timestamp), DAY) AS total_days
FROM
    Target_SQL_BCase.orders;

# 2. In-depth Exploration of Order Patterns
Key Findings & Insights
Exponential Growth: The business experienced massive year-over-year growth, increasing from 329 orders in 2016 to over 54,000 in 2018.

Seasonal Peaks: Order volume shows clear seasonality, peaking in the middle of the year (May through August).

Daily Purchase Window: Customers are most active in the afternoon, with the highest concentration of orders placed between 1 PM and 6 PM.

SQL Query: Daily Purchase Behavior
SELECT
    CASE
        WHEN EXTRACT(HOUR FROM order_purchase_timestamp) BETWEEN 0 AND 6 THEN 'Dawn'
        WHEN EXTRACT(HOUR FROM order_purchase_timestamp) BETWEEN 7 AND 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM order_purchase_timestamp) BETWEEN 13 AND 18 THEN 'Afternoon'
        ELSE 'Night'
    END AS time_of_day,
    COUNT(order_id) AS total_orders
FROM
    Target_SQL_BCase.orders
GROUP BY
    time_of_day
ORDER BY
    total_orders DESC;

# 3. Economic and Geographic Analysis
Key Findings & Insights
Revenue Growth: Sales revenue grew by 136.98% from 2017 to 2018 for the period of January to August.

Geographic Concentration: The business is heavily reliant on the southeastern states, with São Paulo (SP), Rio de Janeiro (RJ), and Minas Gerais (MG) accounting for the vast majority of customers and sales revenue.

Freight & Delivery Disparity: There is a severe logistical divide. Customers in southeastern states enjoy low average freight costs (e.g., SP at R15.15),whilecustomersinnorthernstatespaysignificantlymore(e.g.,RRatR42.98). Similarly, delivery times to São Paulo average 8 days, while delivery to northern states like Roraima (RR) takes an average of 29 days.

Inaccurate Estimates: While deliveries to the north are slow, they consistently arrive much earlier (16-20 days) than estimated. This suggests the estimation algorithm is overly conservative and may deter customers at checkout.

SQL Query: Average Delivery Time Extremes by State
-- States with Longest Delivery Time
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
    avg_time_to_deliver DESC
LIMIT 5)

UNION ALL

-- States with Shortest Delivery Time
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
    avg_time_to_deliver ASC
LIMIT 5);

# 4. Payment Behavior Analysis
Key Findings & Insights
Credit Card Dominance: Credit cards are the overwhelmingly preferred payment method.

Installment Payments are Key: The option to pay in installments is a major driver of sales. A significant portion of orders are paid over multiple installments, with single-payment (1x) being the most common, followed by 2, 3, and 8 installments.

SQL Query: Popularity of Payment Installments
SELECT
    payment_installments,
    COUNT(order_id) AS number_of_orders
FROM
    Target_SQL_BCase.payments
GROUP BY
    payment_installments
ORDER BY
    number_of_orders DESC;

# Summary of Actionable Insights & Strategic Recommendations
PRIORITY 1: Resolve the Northern Logistics Crisis
Insight: The high freight costs and slow, inaccurately estimated delivery times in the North are the single biggest threat to nationwide growth.

Action: Form a task force to evaluate the feasibility of a northern distribution center or to negotiate new contracts with regional logistics partners. Overhaul the delivery estimation algorithm using historical data to provide more accurate, competitive timelines.

PRIORITY 2: Optimize Marketing and Sales Funnels
Insight: Sales are predictable, peaking mid-year and during afternoon hours. The customer base is heavily concentrated in the Southeast.

Action: Realign the marketing calendar to be more aggressive during the May-August peak season. Focus digital ad spend between 1 PM and 6 PM. Launch loyalty and retention programs specifically for customers in SP, RJ, and MG.

PRIORITY 3: Enhance the Financial Ecosystem
Insight: Customers rely heavily on credit cards and installment payments.

Action: Make financing a core feature of the platform. Prominently feature "Buy Now, Pay Later" (BNPL) and installment options on product and checkout pages. Explore partnerships with major Brazilian credit card issuers for exclusive offers.
