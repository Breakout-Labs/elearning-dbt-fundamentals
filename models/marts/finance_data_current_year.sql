select *
from {{ ref('finance_data') }}

{# Only add filter if variable is true #}
{% if var("add_filter", true) is true %}
  where year = {{ var('fiscal_year') }}  
{% else %}
    -- no filter applied
{% endif %}

