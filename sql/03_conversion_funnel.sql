--Funnel analysis
--Session → purchase funnel

WITH base_sessions AS (
  SELECT
    visitId,
    totals.transactions
  FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
  WHERE _TABLE_SUFFIX BETWEEN '20170701' AND '20170801'
)

SELECT
  COUNT(*) AS total_sessions,
  COUNTIF(transactions IS NOT NULL) AS purchasing_sessions,
  COUNTIF(transactions IS NOT NULL) * 1.0 / COUNT(*) AS conversion_rate
FROM base_sessions;