--Conversion rate by source/medium
WITH base_sessions AS (
  SELECT
    trafficSource.source AS source,
    trafficSource.medium AS medium,
    totals.transactions AS transactions
  FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
  WHERE _TABLE_SUFFIX BETWEEN '20170701' AND '20170801'
)

SELECT
  source,
  medium,
  COUNT(*) AS sessions,
  COUNTIF(transactions > 0) AS purchases,
  ROUND(COUNTIF(transactions > 0) * 100.0 / COUNT(*), 2) AS conversion_rate_pct
FROM base_sessions
GROUP BY source, medium
HAVING sessions > 100
ORDER BY conversion_rate_pct DESC
LIMIT 15;