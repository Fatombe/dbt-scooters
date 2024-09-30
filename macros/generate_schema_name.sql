{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- if custom_schema_name is none -%}
        {%- set default_schema = target.schema -%}
        {{ default_schema }}

    {%- else -%}
        {%- set default_schema = "" -%}
        {{ default_schema }}{{ custom_schema_name | trim }}

    {%- endif -%}

{%- endmacro %}