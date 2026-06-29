WITH rev AS (
  SELECT 
    p.product_name,
    p.stock_qty AS ready_stock,                         
    SUM(p.sell_price * oi.quantity_sold) AS revenue,
    SUM(oi.quantity_sold) AS total_qty_sold
  FROM products p
  JOIN order_items oi ON p.product_id = oi.product_id
  GROUP BY p.product_name, p.stock_qty  
)
SELECT 
  product_name, 
  revenue, 
  ROUND(revenue * 100.0 / SUM(revenue) OVER(), 2) AS contributed,
  CASE
    WHEN ready_stock < total_qty_sold THEN 'Understock'
    WHEN ready_stock > total_qty_sold * 3 THEN 'Overstock'
    ELSE 'Healthy'
  END AS status
FROM rev
ORDER BY contributed DESC;