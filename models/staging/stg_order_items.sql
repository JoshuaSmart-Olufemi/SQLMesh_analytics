MODEL (
    name staging.stg_order_items,
    kind VIEW,
    cron '@daily',
    grain order_item_id, 
    audits (
        not_null(columns := (order_item_id))
    ),
);

SELECT  
    order_item_id 
    , order_id 
    , product_id 
    , seller_id
    , quantity 
    , unit_price
    , total_price
    , commission_rate 
    , product_category  
FROM analytics.raw.order_items