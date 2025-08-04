{% macro default_schema() %}

'{{ env_var("SCHEMA", "public") }}'

{% endmacro %}