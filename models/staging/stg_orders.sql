MODEL (
    name staging.stg_orders,
    kind VIEW,
    cron '@daily',
    grain order_id,
    audits (
        not_null(columns := (order_id)),
        unique_values(columns := (order_id))
    ),
);

SELECT 
    order_id
    , user_id
    , order_date 
    , order_status 
    , total_amount  
    , subtotal   
    , tax_amount      
    , shipping_cost  
    , discount_amount 
    , payment_method 
    , shipping_address_country 
    , shipping_speed 
    , fulfillment_date 
    , blessed_friday_order 
    , faithx_event_discount 
    FROM analytics.raw.orders  