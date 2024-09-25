select ag."group", count(*) as trips, sum(price_rub) as revenue_ru
from {{ ref("trips_users") }} as tu 
cross join {{ ref("age_groups") }} as ag 
where tu.age >= age_start and tu.age <=age_end
group by ag."group"