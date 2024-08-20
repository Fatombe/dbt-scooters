SELECT 
DATE(started_at) AS date,
COUNT(id) AS trips,
MAX(price) / 100 AS max_price_rub,
AVG(distance) / 1000 AS avg_distance_km
FROM  scooters_raw.trips 
GROUP BY DATE(started_at)
ORDER BY 1