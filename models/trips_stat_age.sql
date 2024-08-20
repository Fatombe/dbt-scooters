select age, avg(trips) as avg_trips
from
    (
        select t1.date, t1.age, count(*) as trips
        from
            (
                select
                    extract(year from t.started_at)
                    - extract(year from u.birth_date) as age,
                    date(t.started_at) as "date"
                from scooters_raw.trips t
                join scooters_raw.users u on t.user_id = u.id
            ) as t1
        group by t1.date, t1.age
    )
group by age
order by age
