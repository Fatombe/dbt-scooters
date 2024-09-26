select first_name, sex
from {{ source("scooters_raw", "users")}}
where sex is not null
group by first_name, sex