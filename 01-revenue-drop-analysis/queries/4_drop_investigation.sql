WITH rev AS (
  SELECT
    region,
    DATE_TRUNC('month', order_date) AS month,
    SUM(price * quantity) AS revenue
  FROM sales
  GROUP BY region, month
),
changed AS (
  SELECT
    *,
    LAG(revenue) OVER (PARTITION BY region ORDER BY month) AS prev_amount,
    revenue - LAG(revenue) OVER (PARTITION BY region ORDER BY month) AS selisih,
    ROUND(
      (revenue - LAG(revenue) OVER (PARTITION BY region ORDER BY month)) 
      * 100.0 / LAG(revenue) OVER (PARTITION BY region ORDER BY month), 2
    ) AS percentage
  FROM rev
)
SELECT *
FROM changed
WHERE percentage < -10
ORDER BY month;