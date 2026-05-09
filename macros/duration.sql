{% macro duration(start_col, end_col, unit='hours') %}

    datediff('{{ unit }}', {{ start_col }}, {{ end_col }})

{% endmacro %}