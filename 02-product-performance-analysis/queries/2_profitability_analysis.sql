SELECT 
  p.category, 
  SUM((p.sell_price - p.cost_price) * oi.quantity_sold) AS profit,
  ROUND(
    SUM((p.sell_price - p.cost_price) * oi.quantity_sold) * 100.0 
    / SUM(p.sell_price * oi.quantity_sold)
  , 2) AS profit_margin 
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY profit DESC;