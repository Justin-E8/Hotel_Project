SET search_path TO "Hotel";

-- Testing Triggers 1 and 2 ============================================================================================================

ALTER TABLE HOTEL
DROP CONSTRAINT hotel_num_rooms_check,
ADD CONSTRAINT hotel_num_rooms_check CHECK (num_rooms BETWEEN 5 AND 999);

UPDATE Hotel
SET num_rooms = 5

SELECT * 
FROM Hotel
WHERE hotel_ID = 100001

-- Before 1st deletion:
SELECT * 
FROM Room
WHERE hotel_ID = 100001

INSERT INTO Room VALUES 
	(100001, 106, 230.00, 5, 'Sea View', true);

DELETE
FROM Room
WHERE hotel_ID = 100001 AND room_num = 105

-- Testing Triggers 3 and 4 ===============================================================================================================================

SELECT * 
FROM Renting

SELECT * 
FROM Renting_Archive

DELETE FROM Booking_Archive

DELETE FROM Renting WHERE room_num = 302

-- Testing Trigger 5 ===============================================================================================================================

SELECT *
FROM Booking_Archive

SELECT *
FROM Booking

SELECT *
FROM Renting

INSERT INTO Renting VALUES
	(100003, 301, 'G7H8I9', '2025-09-05', '2025-09-12', '333445567');



-- Testing Triggers 6 and 7 ===============================================================================================================================

INSERT INTO Booking_Archive VALUES
	('Bob', 'Johnson', 100001, 101, '2025-09-04', '2025-09-05', '2025-09-12');

INSERT INTO Renting_Archive VALUES
	('Bob', 'Johnson', 100001, 101, '2025-09-05', '2025-09-12', 'Good room service', '222334455');



-- Testing Triggers 8 and 9 ===============================================================================================================================

SELECT *
FROM Chain
WHERE chain_name = 'Marriott'

INSERT INTO Hotel VALUES
	(100009, '5th St', 8, 'Toronto', 3, 5, '888990011', 'Marriott');

DELETE
FROM Hotel
Where hotel_ID = 100009

SELECT *
FROM Hotel
WHERE chain_name = 'Marriott'



-- Testing Query 1 ======================================================================================================================

INSERT INTO Renting VALUES
	    (100001, 101, 'A1B2C3', '2025-01-15', '2024-01-18', '111223345');

SELECT * -- NOTE: This is originally a DELETE; the SELECT was used for testing
FROM Renting 
WHERE end_date < CURRENT_DATE;



-- Testing Query 2 ======================================================================================================================

UPDATE Hotel
SET num_rooms = 80
WHERE hotel_id = 100002

SELECT *
FROM Hotel

UPDATE Hotel AS h
SET num_rooms = (SELECT COUNT(*)
	FROM Room AS r
	WHERE r.hotel_ID = h.hotel_ID);



-- Testing Query 3 ======================================================================================================================

UPDATE Chain
SET num_locations = 30
WHERE chain_name = 'Best Western'

UPDATE Chain AS c
SET num_locations = (SELECT COUNT(*)
	FROM Hotel AS h
	WHERE h.chain_name = c.chain_name);

SELECT *
FROM Chain