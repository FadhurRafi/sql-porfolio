WITH quantity AS (
  SELECT 
    p.product_name, 
    p.stock_qty AS ready_stock,
    SUM(oi.quantity_sold) AS total_qty_sold
  FROM products p
  JOIN order_items oi ON p.product_id = oi.product_id
  GROUP BY p.product_name, p.stock_qty
)
SELECT *,
  CASE
    WHEN ready_stock < total_qty_sold THEN 'Understock'
    WHEN ready_stock > total_qty_sold * 3 THEN 'Overstock'
    ELSE 'Healthy'
  END AS status
FROM quantity
ORDER BY status, total_qty_sold DESC;