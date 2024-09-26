with full_names_cte as (
    select *
    from {{ ref("first_name_sex")}} as f 
    union all
    select *
    from {{ ref("null_names")}} as n
)

select s.id, s.first_name, s.last_name, s.phone, fn.sex, s.birth_date
from full_names_cte as fn 
join {{ source("scooters_raw", "users")}} as s 
using (first_name)