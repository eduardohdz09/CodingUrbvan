-- How many clients exist
SELECT COUNT(*) AS "total_clients" FROM clients;

-- Which are the 10 clients that have spent more money with their reservations
SELECT
    clients.client_id,
    clients.first_name,
    clients.last_name,
    SUM(reservations.total_price) AS "total"
FROM clients
inner join reservations on clients.client_id = reservations.client_id
GROUP BY clients.client_id ORDER BY "total" DESC LIMIT 10;

-- How many trips have more seats reserved than their vehicle capacity
WITH
    result AS (
        SELECT reservations.trip_id,
            SUM(reservations.seats) AS "seats_reserved",
            trips.vehicle_capacity
        FROM reservations
        INNER JOIN trips on reservations.trip_id = trips.trip_id
        GROUP BY reservations.trip_id, trips.vehicle_capacity
     )
    SELECT
        COUNT(*) AS "trips_oversolded"
    FROM result
    WHERE seats_reserved > vehicle_capacity;

-- How many different fullnames (firstname + lastname) are in tables clients & driver combined

WITH
     result AS (
         SELECT first_name || ' ' || last_name AS "full_name"
         FROM clients
         WHERE first_name is not null and last_name is not null
         UNION
         SELECT first_name || ' ' || last_name
         FROM drivers
         WHERE first_name is not null and last_name is not null
     )
    SELECT DISTINCT COUNT(*) FROM result;