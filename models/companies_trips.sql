with cte_trips as (
    select m.company, count(*) as trips
    from {{ ref("trips_prep")}} as tp 
    JOIN {{ ref("models")}} as m
    on tp.scooter_hw_id = m.hardware_id
    group by m.company
),
cte_companies as (
    select ct.company, ct.trips, c.scooters
    from cte_trips as ct 
    JOIN {{ ref("companies")}} as c
    on ct.company = c.company
) 
select company, trips/ cast(scooters as float) as trips_per_scooter
from cte_companies