SELECT
  DATE_TRUNC('month', order_date) AS month,
  SUM(price * quantity) AS total_revenue
FROM sales
GROUP BY month
ORDER BY month;