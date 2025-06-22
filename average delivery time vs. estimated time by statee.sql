USE customer_analytics;

SELECT 
    c.customer_state,
    ROUND(AVG(DATEDIFF(o.order_delivered_customer_date, o.order_purchase_timestamp)), 2) AS avg_actual_delivery_time,
    ROUND(AVG(DATEDIFF(o.order_estimated_delivery_date, o.order_purchase_timestamp)), 2) AS avg_estimated_delivery_time
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.order_status = 'delivered'
  AND o.order_delivered_customer_date IS NOT NULL
  AND o.order_estimated_delivery_date IS NOT NULL
  AND DATEDIFF(o.order_delivered_customer_date, o.order_purchase_timestamp) BETWEEN 0 AND 60
  AND DATEDIFF(o.order_estimated_delivery_date, o.order_purchase_timestamp) BETWEEN 0 AND 60
GROUP BY c.customer_state
ORDER BY avg_actual_delivery_time DESC;
