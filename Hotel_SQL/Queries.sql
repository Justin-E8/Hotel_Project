SET search_path = "Hotel";

-- Queries

--This query gets key the key information for rooms in hotels in the toronto area that are relatively cheap and have a good rating
SELECT chain_name,
	   star_rating,
	   price,
	   room_num,
	   r.hotel_id,
	   street_name,
	   street_num,
	   city
FROM room r
JOIN hotel h ON r.hotel_id = h.Hotel_id
WHERE star_rating >= 4 AND price <= 300 AND capacity = 2 AND city = 'Toronto';

--This query uses aggregation to rank hotels by the average price of the rooms in the hotel in order to find the most cost effective hotels in New York
SELECT
	chain_name,
	h.hotel_id,
	city,
	street_name,
	street_num,
	star_rating,
	ROUND(AVG(price), 2) AS average_price
FROM hotel h
JOIN room r ON h.hotel_id = r.hotel_id
WHERE city = 'New York'
GROUP BY h.hotel_id
ORDER BY average_price;

--This query finds managers of Best Western hotels that have a 4 rating or higher, the purpose of a query like this could be for Best Western to determine which managers may deserve raises or bonuses
SELECT 
	SIN,
	job_title,
	first_name,
	last_name,
	e.hotel_id,
	chain_name,
	star_rating
FROM employee e
JOIN hotel h ON e.SIN = h.manager_SIN
WHERE h.star_rating >= 4 and chain_name = 'Best Western';


--This query uses a nested query to find the hotels with a 3 rating or higher in New York that also have rooms with the extra storage amenity
SELECT *
FROM room r
JOIN amenities a ON r.room_num = a.room_num 
	AND r.hotel_id = a.hotel_id
WHERE
	a.amenity = 'Extra Storage'
	AND r.hotel_id in	
	(SELECT hotel_id
	FROM hotel 
	WHERE star_rating >= 3 AND city = 'New York');
