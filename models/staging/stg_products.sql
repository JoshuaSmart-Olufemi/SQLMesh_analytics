MODEL (
    name staging.stg_products, 
    kind VIEW,
    cron '@daily',
    grain product_id,
    audits (
        not_null(columns := (product_id)),
        unique_values(columns := (product_id))

    ),
);

SELECT 
    product_id
    , seller_id  
    , category_primary 
    , category_secondary 
    , subcategory 
    , price 
    , cost 
    , inventory_quantity 
    , product_status 
    , created_date 
    , last_updated_date 
    , product_tags 
    , weight_lbs 
    , dimensions_inches 
    , christian_themed 
    , target_audience 
    , seasonal_product :: BOOLEAN
FROM analytics.raw.products