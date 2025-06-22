USE customer_analytics;

SELECT
    p.payment_type,

    -- classify delivery speed based on time difference
    CASE
        WHEN DATEDIFF(o.order_delivered_customer_date, o.order_purchase_timestamp) <= 5 THEN 'fast'
        WHEN DATEDIFF(o.order_delivered_customer_date, o.order_purchase_timestamp) BETWEEN 6 AND 10 THEN 'average'
        ELSE 'slow'
    END AS delivery_speed,

    ROUND(AVG(r.review_score), 2) AS avg_review_score

FROM orders o
JOIN order_reviews r ON o.order_id = r.order_id
JOIN order_payments p ON o.order_id = p.order_id

WHERE o.order_status = 'delivered'
  AND o.order_delivered_customer_date IS NOT NULL
  AND r.review_score IS NOT NULL

GROUP BY 
    p.payment_type,
    CASE
        WHEN DATEDIFF(o.order_delivered_customer_date, o.order_purchase_timestamp) <= 5 THEN 'fast'
        WHEN DATEDIFF(o.order_delivered_customer_date, o.order_purchase_timestamp) BETWEEN 6 AND 10 THEN 'average'
        ELSE 'slow'
    END

ORDER BY 
    p.payment_type,
    delivery_speed;
