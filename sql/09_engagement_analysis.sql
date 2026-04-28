--Pgeviews vs conversion
WITH session_engagement AS (
  SELECT
    totals.pageviews AS pageviews,
    totals.transactions AS transactions
  FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
  WHERE _TABLE_SUFFIX BETWEEN '20170701' AND '20170801'
)

SELECT
  CASE
    WHEN pageviews = 1 THEN '1 page'
    WHEN pageviews BETWEEN 2 AND 5 THEN '2-5 pages'
    WHEN pageviews BETWEEN 6 AND 10 THEN '6-10 pages'
    ELSE '11+ pages'
  END AS engagement_bucket,

  COUNT(*) AS sessions,
  COUNTIF(transactions > 0) AS purchases,

  ROUND(
    COUNTIF(transactions > 0) * 100.0 / COUNT(*),
    2
  ) AS conversion_rate_pct

FROM session_engagement
GROUP BY engagement_bucket
ORDER BY conversion_rate_pct DESC;