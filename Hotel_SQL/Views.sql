SET search_path = "Hotel";

-- Views
CREATE VIEW avail_rooms_per_city AS
SELECT
    h.city,
    COUNT(r.room_num) AS room_count
FROM hotel h
JOIN room r ON h.hotel_id = r.hotel_id
LEFT JOIN renting x ON r.room_num = x.room_num AND r.hotel_id = x.hotel_id
WHERE x.room_num IS NULL
GROUP BY h.city;

CREATE VIEW hotel_capacity AS
SELECT
	h.hotel_id,
	chain_name,
	sum(capacity) AS total_capacity
FROM hotel h
JOIN room r ON h.hotel_id = r.hotel_id
GROUP BY h.hotel_id;

SELECT * FROM hotel_capacity WHERE hotel_id = 400007 --Example of using this on a specific hotel
