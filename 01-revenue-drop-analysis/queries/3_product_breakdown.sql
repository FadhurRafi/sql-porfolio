WITH a AS (
  SELECT
    region,
    product,
    SUM(price * quantity) AS revenue
  FROM sales
  GROUP BY region, product
),
b AS (
  SELECT
    *,
    DENSE_RANK() OVER (PARTITION BY region ORDER BY revenue DESC) AS ranking
  FROM a
)
SELECT *
FROM b
WHERE ranking <= 2
ORDER BY region, ranking;