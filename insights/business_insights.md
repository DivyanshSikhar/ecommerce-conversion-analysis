# Analysis Overview

This analysis examines user conversion behavior using the Google Analytics sample e-commerce dataset hosted in BigQuery.

The study focuses on user sessions between July 1 and July 31, 2017 and evaluates how acquisition channels, device type, user engagement, and behavioral patterns influence purchase conversion.

The analysis was conducted using SQL in BigQuery.

# Key Findings

## 1. Conversion Funnel
The platform recorded 74,368 user sessions during the analysis period, of which 1,074 resulted in a purchase. This corresponds to a session-to-purchase conversion rate of 1.44%.

The conversion rate is broadly consistent with typical e-commerce browsing behavior, where the majority of sessions do not result in an immediate purchase.

## 2. Channel Insights
Direct traffic achieved one of the strongest conversion rates (3.15%) among high-volume channels, suggesting that users already familiar with the brand exhibit higher purchase intent.

Paid Google search traffic (CPC) materially outperformed organic Google traffic, converting at 2.24% compared to 0.81%. This indicates that paid campaigns may be more effective at attracting high-intent users.

Although Google Organic generated the largest traffic volume, its lower conversion efficiency suggests that much of the traffic may be exploratory rather than transactional.

YouTube referrals produced substantial traffic volume but almost no purchases, implying that these users are likely in an awareness or discovery stage rather than ready to buy.

## 3. Device Behavior

Desktop users demonstrated significantly stronger conversion behavior than mobile and tablet users.

Desktop sessions converted at 2.04%, compared to only 0.39% for mobile devices. Although mobile devices generated a substantial share of total sessions, they contributed disproportionately few purchases.

This gap may indicate friction in the mobile purchase journey, such as usability issues, slower checkout completion, or lower purchase intent among mobile visitors.

## 4. User Behavior
The dataset contained 60,523 unique users, of which 1,000 completed at least one transaction, resulting in a user conversion rate of 1.65%.

The average user generated only 1.23 sessions during the analysis period, indicating relatively limited repeat visitation behavior.

The small gap between session-level and user-level conversion rates suggests that purchasing users often convert without requiring many repeated sessions.

## 5. Engagement and Conversion Behavior
User engagement showed a strong relationship with purchase behavior. 
Sessions with only one pageview produced no purchases, while sessions with more than 11 pageviews converted at 17.49%.

This suggests that deeper browsing behavior is strongly associated with higher purchase intent. Users who engage extensively with products and site content are substantially more likely to complete a transaction.


## 6. Time to Conversion
Purchasing users took an average of 48.44 hours between their first recorded visit and first purchase.

This indicates that users often require time before completing a transaction, suggesting that the purchase journey involves consideration and evaluation rather than exclusively impulse-driven purchasing behavior.

## 7. Cohort Conversion Analysis
Conversion performance varied significantly across user acquisition cohorts.

Daily cohort conversion rates ranged from below 1% to nearly 3%, indicating meaningful differences in acquisition quality and user intent over time.

Several mid-July acquisition cohorts demonstrated notably stronger conversion performance than earlier and later cohorts.

# Overall Conclusion
The analysis suggests that conversion performance is strongly influenced by acquisition quality, device experience, and user engagement depth.

High-intent traffic sources such as direct and paid search demonstrated substantially stronger conversion performance than broader discovery-oriented channels. Desktop users converted at significantly higher rates than mobile users, indicating potential friction in the mobile purchase journey.

User engagement emerged as one of the strongest behavioral indicators of conversion likelihood, while cohort analysis revealed meaningful variation in acquisition quality over time.

Overall, the findings suggest that improving mobile usability, strengthening re-engagement strategies, and encouraging deeper on-site engagement could meaningfully improve conversion performance.