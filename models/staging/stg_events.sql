MODEL (
    name staging.stg_events,
    kind VIEW,
    cron '@hourly',
    audits (
    unique_values(columns := (event_id, user_id, event_date)),
    not_null(columns := (event_id, user_id, event_date))
  ),
    grain event_id 
);

SELECT
    event_id,
    user_id,
    event_type,
    event_timestamp,
    -- Extract date for incremental processing
    DATE(event_timestamp) as event_date,
    revenue
FROM
    raw.events
WHERE
    event_id IS NOT NULL;