MODEL (
    name staging.stg_userss,
    kind VIEW,
    cron '@daily',
    grain user_id,
    audits (
        not_null(columns := (user_id)),
        unique_values(columns := (user_id))
    ),
);

SELECT 
user_id
, email 
, first_name
, last_name
, country_code
, state_province 
, city 
, signup_date 
, user_type 
, faith_driven_consumer 
, age_group 
, gender 
, customer_acquisition_channel
, total_lifetime_value
, last_login_date
, account_status 
FROM analytics.raw.userss;