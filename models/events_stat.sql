select count("type" = 'start_search' or null) / cast(count("type" = 'cancel_search' or null) as float) as cancel_pct
from {{ ref("events_full")}}