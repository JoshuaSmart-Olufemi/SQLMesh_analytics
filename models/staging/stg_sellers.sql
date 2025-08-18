MODEL (
    name staging.stg_sellers,
    kind VIEW,
    cron '@daily',
    grain seller_id,
    audits (not_null(columns := (seller_id))
    ),
);

SELECT 
    seller_id 
    , business_name
    , first_name 
    , last_name 
    , business_type 
    , country_code 
    , state_province 
    , city 
    , registration_date
    , seller_status 
    , total_products 
    , total_sales_ytd
    , commission_paid_ytd 
    , avg_rating  
    , total_reviews  
    , christian_certified 
    , faithx_partner 
    , store_monthly_fee 
FROM analytics.raw.sellers