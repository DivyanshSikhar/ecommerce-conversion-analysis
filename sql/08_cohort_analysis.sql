--Users grouped by first visit date
WITH first_visit AS (
  SELECT
    fullVisitorId,

    MIN(PARSE_DATE('%Y%m%d', date)) AS cohort_date

  FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
  WHERE _TABLE_SUFFIX BETWEEN '20170701' AND '20170801'
  GROUP BY fullVisitorId
),

user_activity AS (
  SELECT
    fullVisitorId,
    totals.transactions AS transactions
  FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
  WHERE _TABLE_SUFFIX BETWEEN '20170701' AND '20170801'
)

SELECT
  cohort_date,

  COUNT(DISTINCT user_activity.fullVisitorId) AS users,

  COUNT(DISTINCT CASE
    WHEN transactions > 0 THEN user_activity.fullVisitorId
  END) AS purchasers,

  ROUND(
    COUNT(DISTINCT CASE
      WHEN transactions > 0 THEN user_activity.fullVisitorId
    END) * 100.0
    / COUNT(DISTINCT user_activity.fullVisitorId),
    2
  ) AS cohort_conversion_rate_pct

FROM first_visit
JOIN user_activity
  ON first_visit.fullVisitorId = user_activity.fullVisitorId

GROUP BY cohort_date
ORDER BY cohort_date;