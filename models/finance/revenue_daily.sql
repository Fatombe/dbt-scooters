select sum(price_rub) as revenue_rub, "date", {{updated_at()}}
from {{ ref("trips_prep")}} as "trips_prep"
{% if is_incremental() %}
where "date" >= (select max("date") - interval '2' day from {{ this }})
{% endif %}
group by "date", updated_at
order by "date"