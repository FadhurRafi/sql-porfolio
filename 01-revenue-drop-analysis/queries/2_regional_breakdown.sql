WITH monthly_region AS (
  SELECT
    DATE_TRUNC('month', order_date) AS month,
    region,
    SUM(price * quantity) AS total_revenue
  FROM sales
  GROUP BY month, region
)
SELECT
  month,
  region,
  total_revenue,
  LAG(total_revenue) OVER (PARTITION BY region ORDER BY month) AS prev_month_revenue,
  total_revenue - LAG(total_revenue) OVER (PARTITION BY region ORDER BY month) AS selisih,
  ROUND(
    (total_revenue - LAG(total_revenue) OVER (PARTITION BY region ORDER BY month)) 
    * 100.0 / LAG(total_revenue) OVER (PARTITION BY region ORDER BY month), 2
  ) AS pct_change
FROM monthly_region
ORDER BY month, region;