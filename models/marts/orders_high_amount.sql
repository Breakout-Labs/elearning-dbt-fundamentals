{{ config(materialized='table') }}


select *
from {{ ref('orders') }}
where amount_in_dollar > 50