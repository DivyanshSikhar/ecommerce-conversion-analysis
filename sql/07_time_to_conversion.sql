--Time to first purchase
WITH user_sessions AS (
  SELECT
    fullVisitorId,
    visitStartTime,
    totals.transactions AS transactions
  FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
  WHERE _TABLE_SUFFIX BETWEEN '20170701' AND '20170801'
),

user_times AS (
  SELECT
    fullVisitorId,

    MIN(visitStartTime) AS first_visit,

    MIN(
      CASE
        WHEN transactions > 0 THEN visitStartTime
      END
    ) AS first_purchase

  FROM user_sessions
  GROUP BY fullVisitorId
)

SELECT
  ROUND(
    AVG(first_purchase - first_visit) / 3600,
    2
  ) AS avg_hours_to_purchase

FROM user_times
WHERE first_purchase IS NOT NULL;