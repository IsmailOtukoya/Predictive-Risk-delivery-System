USE customer_analytics;
SELECT 
    p.product_category_name,
    COUNT(*) AS order_count,
    ROUND(AVG(DATEDIFF(o.order_delivered_customer_date, o.order_purchase_timestamp)), 2) AS avg_delivery_days
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.order_status = 'delivered'
  AND o.order_delivered_customer_date IS NOT NULL
  AND o.order_purchase_timestamp IS NOT NULL
  AND DATEDIFF(o.order_delivered_customer_date, o.order_purchase_timestamp) BETWEEN 0 AND 60
GROUP BY p.product_category_name
ORDER BY order_count DESC
LIMIT 5;
