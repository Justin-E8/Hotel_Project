SET search_path = "Hotel";

-- Index 1: Most expensive at the start to advertise premium options to customers first 
-- No need to specify Null value position since price has a NOT NULL constraint (as does most attributes)
CREATE INDEX room_price_idx 
ON Room (price DESC)

-- Index 2: Partial index; non-extendable rooms will continue to use sequential sort
CREATE INDEX room_capacity_idx 
ON Room (capacity DESC) 
WHERE is_extendable = TRUE; 


-- Index 3: More customer-friendly to advertise the high rated hotels first
CREATE INDEX hotel_star_rating_idx 
ON Hotel (star_rating DESC);

-- Index 4
CREATE INDEX hotel_chain_name_idx 
ON Hotel (chain_name);


-- Index 5: Multi-valued index, will sort lexicographically, prioritizing start_date
CREATE INDEX booking_date_range_idx 
ON Booking (start_date, end_date ASC);


-- Testing these indexes with some queries =======================================================================================================================================================

SET enable_seqscan = OFF;
RESET enable_seqscan; 

-- Testing index 1
SET enable_seqscan = OFF;
EXPLAIN ANALYZE (
    SELECT *
    FROM Room
	WHERE price BETWEEN 200 AND 370
	ORDER BY price
)

-- Testing index 2
SET enable_seqscan = OFF;
EXPLAIN ANALYZE (
    SELECT *
    FROM Room
	WHERE is_extendable = TRUE AND capacity > 2
	ORDER BY capacity
)

-- Testing index 3
SET enable_seqscan = OFF;
EXPLAIN ANALYZE (
    SELECT *
    FROM Hotel
	ORDER BY star_rating
)

-- Testing index 4
SET enable_seqscan = OFF;
EXPLAIN ANALYZE (
    SELECT *
    FROM Hotel
	ORDER BY chain_name
)

-- Testing index 5
SET enable_seqscan = OFF;
EXPLAIN ANALYZE (
	SELECT * 
	FROM Booking 
	WHERE start_date > '2024-04-01' AND end_date < '2025-07-23'
)
