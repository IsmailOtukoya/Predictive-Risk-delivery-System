USE customer_analytics;

SELECT 
-- a column that shows wheather late or not 1 for late and  0 for not late
CASE
	WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date THEN 1
    ELSE 0
END AS is_late,
    
COUNT(*) AS Order_Count,
ROUND(AVG(r.review_score), 2) AS Avg_review_score

FROM orders o 
JOIN order_reviews r ON o.order_id = r.order_id

WHERE o.order_status = 'delivered'
  AND o.order_delivered_customer_date IS NOT NULL
  AND o.order_estimated_delivery_date IS NOT NULL
  AND r.review_score IS NOT NULL

GROUP BY is_late
ORDER BY is_late;