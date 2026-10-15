{% macro normalize_email(email) -%}
    lower({{ email }})
{%- endmacro %}
