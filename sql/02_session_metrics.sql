--Generating session metrics
--Total orders, total revenue and avg order value

WITH base_sessions AS (
  SELECT
    totals.transactions,
    totals.totalTransactionRevenue
  FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
  WHERE _TABLE_SUFFIX BETWEEN '20170701' AND '20170801'
)

SELECT
  SUM(transactions) AS total_orders,
  SUM(totalTransactionRevenue) / 1000000 AS revenue,
  SUM(totalTransactionRevenue) / SUM(transactions) / 1000000 AS avg_order_value
FROM base_sessions
WHERE totals.transactions IS NOT NULL;