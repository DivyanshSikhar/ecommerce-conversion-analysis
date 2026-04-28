--User level analysis
WITH user_summary AS (
  SELECT
    fullVisitorId,
    COUNT(*) AS total_sessions,
    SUM(IFNULL(totals.transactions, 0)) AS total_transactions
  FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
  WHERE _TABLE_SUFFIX BETWEEN '20170701' AND '20170801'
  GROUP BY fullVisitorId
)

SELECT
  COUNT(*) AS total_users,

  COUNTIF(total_transactions > 0) AS purchasing_users,

  ROUND(
    COUNTIF(total_transactions > 0) * 100.0 / COUNT(*),
    2
  ) AS user_conversion_rate_pct,

  ROUND(AVG(total_sessions), 2) AS avg_sessions_per_user

FROM user_summary;