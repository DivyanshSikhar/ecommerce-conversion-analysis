-- Project: Product Analytics SQL Case Study
-- Analysis: Data Exploration

WITH base_sessions AS (
  SELECT
    fullVisitorId,
    visitId,
    visitStartTime,
    
    trafficSource.source,
    trafficSource.medium,

    device.deviceCategory,

    totals.visits,
    totals.pageviews,
    totals.transactions,
    totals.totalTransactionRevenue

  FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
  WHERE _TABLE_SUFFIX BETWEEN '20170701' AND '20170801'
)

SELECT *
FROM base_sessions
LIMIT 10;