/*
- Find the number of taxi rides for each taxi company for November 15-16, 2017
- Name the resulting field as trips_amount
- Sort the results by the trips_amount field in descending order.
 */
SELECT
    cabs.company_name AS company_name,
    COUNT(trips.trip_id) AS trips_amount
FROM
    trips
    LEFT JOIN cabs ON cabs.cab_id = trips.cab_id
WHERE
    trips.start_ts::date BETWEEN '2017-11-15' AND '2017-11-16'
GROUP BY
    company_name
ORDER BY
    trips_amount DESC;

/*
- Find the number of rides for every taxi company whose name contains the words "Yellow" or "Blue" for November 1-7, 2017.
- Name the resulting variable trips_amount.
- Group the results by the company_name field.
*/ 
SELECT 
    subquery.company_name,
    COUNT(trips.trip_id) AS trips_amount
FROM
    trips
    INNER JOIN (
        SELECT
            *
        FROM
            cabs
        WHERE
            company_name LIKE '%Yellow%' OR
            company_name LIKE '%Blue%'
        ) AS subquery ON subquery.cab_id = trips.cab_id
WHERE
    trips.start_ts::date BETWEEN '2017-11-01' AND '2017-11-07'
GROUP BY
    company_name

/*
- Find the number of rides for Flash Cab and Taxi Affiliation Services for November 1-7, 2017.
- Name the resulting variable trips_amount.
- Join the rides for all other companies in the group "Other".
- Group the data by taxi company names. 
- Name the field with taxi company names company.
- Sort the result in descending order by trips_amount.
*/
SELECT
    CASE WHEN cabs.company_name = 'Flash Cab' OR cabs.company_name = 'Taxi Affiliation Services' THEN cabs.company_name
    ELSE 'Other' END AS company,
    COUNT(trips.trip_id) AS trips_amount
FROM
    trips
    INNER JOIN cabs ON cabs.cab_id = trips.cab_id
WHERE
    trips.start_ts::date BETWEEN '2017-11-01' AND '2017-11-07'
GROUP BY
    company
ORDER BY
    trips_amount DESC;

/*
- Retrieve the identifiers of the O'Hare and Loop neighborhoods from the neighborhoods table
*/
SELECT
    neighborhood_id,
    name
FROM
    neighborhoods
WHERE
    name LIKE 'Loop' OR
    name LIKE '%Hare'

/*
- Retrieve from the trips table all the rides that started in the Loop (pickup_location_id: 50) on a Saturday and ended at O'Hare
 (dropoff_location_id: 63).
- Get the weather conditions and duration for each ride, ignoring rides if weather conditions were unavailable
- Sort by trip_id.
*/
SELECT
    trips.start_ts,
    CASE WHEN weather_records.description LIKE '%rain%' OR weather_records.description LIKE '%storm%' THEN 'Bad'
    ELSE 'Good' END AS weather_conditions,
    trips.duration_seconds
FROM
    trips
    INNER JOIN weather_records ON weather_records.ts = trips.start_ts
WHERE
    EXTRACT('isodow' FROM trips.start_ts) = 6 AND
    trips.pickup_location_id = 50 AND
    trips.dropoff_location_id = 63