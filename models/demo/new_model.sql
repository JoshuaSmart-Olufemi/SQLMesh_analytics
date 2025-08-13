MODEL (
    name sqlmesh_example.new_model,
    kind FULL,
    cron '@daily', 
    grain item_id,
    description 'demo/example model'
);

SELECT 
item_id
, num_orders
, num_orders / 2 as half
FROM sqlmesh_example.full_model