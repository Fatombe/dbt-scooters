{{ config(full_refresh = false) }}

select distinct *
from {{ source("scooters_raw", "events") }} as se
{% if is_incremental()%}
where
    "timestamp" > (select max("timestamp") from {{ this }})
    order by "timestamp"
{% else %}
    where
    "timestamp" < date '2023-08-01'
{% endif %}