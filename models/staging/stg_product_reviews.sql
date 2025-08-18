MODEL (
    name staging.stg_product_reviews,
    kind VIEW,
    cron '@daily',
    grain review_id,
    audits (
        not_null(columns := (review_id, product_id, user_id, order_id ))
    ),
);


SELECT
    review_id
    , product_id
    , user_id
    , order_id 
    , rating 
    , review_title 
    , review_text 
    , review_date 
    , verified_purchase
    , helpful_votes 
    , total_votes 
    , seller_response 
    , response_date
FROM analytics.raw.product_reviews