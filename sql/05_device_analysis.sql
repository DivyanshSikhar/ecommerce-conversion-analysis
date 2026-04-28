--Conversion by device (mobile vs desktop)

WITH base_sessions AS (
  SELECT
    device.deviceCategory AS device,
    totals.transactions AS transactions
  FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
  WHERE _TABLE_SUFFIX BETWEEN '20170701' AND '20170801'
)

SELECT
  device,
  COUNT(*) AS sessions,
  COUNTIF(transactions > 0) AS purchases,
  ROUND(COUNTIF(transactions > 0) * 100.0 / COUNT(*), 2) AS conversion_rate_pct
FROM base_sessions
GROUP BY device
ORDER BY conversion_rate_pct DESC;