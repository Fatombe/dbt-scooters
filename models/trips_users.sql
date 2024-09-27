select
    tp.*,
    us.sex,
    extract(year from tp.started_at) - extract(year from us.birth_date) as age,
    {{updated_at()}}
from {{ ref("trips_prep") }} as tp
left join {{ source("scooters_raw", "users") }} as us on tp.user_id = us.id
{% if is_incremental() %}
    where tp.id > (select max(id) from {{ this }})
    order by tp.id
    limit 7500
{% else %}
    where tp.id <= 7500
{% endif %}
