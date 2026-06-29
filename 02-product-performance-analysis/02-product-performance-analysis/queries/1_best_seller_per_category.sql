WITH rev AS (
  SELECT 
    p.product_name, 
    p.category, 
    SUM(oi.quantity_sold) AS total_qty,
    RANK() OVER (
      PARTITION BY p.category 
      ORDER BY SUM(oi.quantity_sold) DESC
    ) AS rank
  FROM products p
  JOIN order_items oi ON p.product_id = oi.product_id 
  GROUP BY p.product_name, p.category 
)
SELECT *
FROM rev
WHERE rank <= 3
ORDER BY category, rank;