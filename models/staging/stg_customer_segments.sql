MODEL (
    name staging.stg_customer_segments,
    kind VIEW, 
    cron '@daily',
    grain segment_id, 
    audits (
        not_null(columns := (segment_id))
    ),
);

SELECT 
    segment_id
    , segment_name 
    , user_id 
    , segment_criteria 
    , assigned_date 
    , segment_value_score
    , predicted_ltv 
    , churn_risk_score 
    , preferred_category 
    , avg_order_value 
    , purchase_frequency_days 
FROM analytics.raw.customer_segments