USE customer_analytics;

SELECT
    o.order_id,
    o.customer_id,
    o.order_purchase_timestamp,
    o.order_delivered_customer_date,
    o.order_estimated_delivery_date,

    -- Engineered Features
    DATEDIFF(o.order_delivered_customer_date, o.order_purchase_timestamp) AS delivery_days,
    DATEDIFF(o.order_estimated_delivery_date, o.order_purchase_timestamp) AS estimated_days,
    DAYOFWEEK(o.order_purchase_timestamp) AS purchase_dayofweek,
    HOUR(o.order_purchase_timestamp) AS purchase_hour,

    -- Payment and Pricing
    p.payment_type,
    i.seller_id,
    i.price,
    i.freight_value,

    -- Product and Location
    pr.product_category_name,
    c.customer_state,

    -- Target Label
    CASE
        WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date THEN 1
        ELSE 0
    END AS is_late

FROM orders o
JOIN order_items i ON o.order_id = i.order_id
JOIN order_payments p ON o.order_id = p.order_id
JOIN products pr ON i.product_id = pr.product_id
JOIN customers c ON o.customer_id = c.customer_id

WHERE o.order_status = 'delivered'
  AND o.order_delivered_customer_date IS NOT NULL
  AND o.order_estimated_delivery_date IS NOT NULL;

