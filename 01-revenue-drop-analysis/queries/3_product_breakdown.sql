WITH a AS (
  SELECT
    region,
    product,
    SUM(price * quantity) AS revenue
  FROM sales
  GROUP BY region, product
)
SELECT
  *,
  DENSE_RANK() OVER (PARTITION BY region ORDER BY revenue DESC) AS ranking
FROM a
WHERE ranking <= 2;