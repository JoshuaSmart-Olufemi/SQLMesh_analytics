MODEL (
    name staging.stg_events,
    kind VIEW,
    cron '@daily',
    audits (
    unique_values(columns := (event_id)),
    not_null(columns := (event_id, user_id))
  ),
    grain event_id 
);

SELECT
    event_id,
    user_id,
    event_type,
    event_timestamp,
    -- Extract date for incremental processing
    cast(event_timestamp as date) as event_date,
    revenue
FROM
    raw.events
WHERE
    event_id IS NOT NULL;