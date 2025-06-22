USE customer_analytics;

SELECT 
    oi.seller_id,
    AVG(DATEDIFF(o.order_delivered_customer_date, o.order_purchase_timestamp)) AS avg_delivery_days,
    PERCENT_RANK() OVER (
        ORDER BY AVG(DATEDIFF(o.order_delivered_customer_date, o.order_purchase_timestamp))
    ) AS delivery_percentile
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered'
  AND o.order_delivered_customer_date IS NOT NULL
  AND o.order_purchase_timestamp IS NOT NULL
GROUP BY oi.seller_id
ORDER BY avg_delivery_days ASC;
