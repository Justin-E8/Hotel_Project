SET search_path TO "Hotel";

-- Trigger 1: Increment num_rooms of a given hotel when a room is added to that hotel, also checking for upper bound ======================================

CREATE FUNCTION f_inc_num_rooms() 
RETURNS TRIGGER AS $$
BEGIN
    
    IF (SELECT num_rooms FROM Hotel WHERE hotel_ID = NEW.hotel_ID) >= 999 THEN
        -- Hotel already at full capacity of rooms, can't add another one
        RAISE EXCEPTION 'A hotel can cannot have more than 999 rooms';
    ELSE
        -- Hotel able to add another room, proceed with the insertion and increment num_rooms
        UPDATE Hotel
        SET num_rooms = num_rooms + 1
        WHERE hotel_ID = NEW.hotel_ID;
    END IF;

    RETURN NEW; -- new room added as is
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER inc_num_rooms
AFTER INSERT ON Room -- Increment num_rooms after insertion occurs
FOR EACH ROW
EXECUTE FUNCTION f_inc_num_rooms();



-- Trigger 2: Decrement num_rooms of a given hotel when a room is removed from that hotel, also checking for lower bound ======================================

CREATE FUNCTION f_dec_num_rooms()
RETURNS TRIGGER AS $$
BEGIN
    IF (SELECT num_rooms FROM Hotel WHERE hotel_ID = OLD.hotel_ID) <= 5 THEN
        RAISE EXCEPTION 'A hotel cannot have less than 5 rooms';
        -- Hotel already only has 5 rooms, can't remove another one
    ELSE
        -- Hotel able to remove a room, proceed with the insertion and increment num_rooms
        UPDATE Hotel
        SET num_rooms = num_rooms - 1
        WHERE hotel_ID = OLD.hotel_ID;
    END IF;

    RETURN OLD; -- Proceed, removing the room as expected
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER dec_num_rooms
BEFORE DELETE ON Room -- Decrement num_rooms before deletion occurs
FOR EACH ROW
EXECUTE FUNCTION f_dec_num_rooms();



-- Trigger 3: Insert new Booking_Archive Tuple when given Booking gets deleted, presumably when the renting starts, or the booking is cancelled

CREATE FUNCTION f_archive_booking()
RETURNS TRIGGER AS $$

DECLARE -- Declaring variables (feature specific to PL-PGSQL), assigning them using the INTO keyword in the SELECT clause  
    f_name TEXT;
    l_name TEXT;
BEGIN
    SELECT first_name, last_name
    INTO f_name, l_name -- INTO statement acts as assigning 'temporary variables'  (local to this function)
    FROM Customer
    WHERE customer_ID = OLD.customer_ID;

    INSERT INTO Booking_Archive VALUES 
        (f_name, l_name, OLD.hotel_ID, OLD.room_num, OLD.date_booking_made, OLD.start_date, OLD.end_date);

    RETURN OLD; 
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER archive_booking
BEFORE DELETE ON Booking 
FOR EACH ROW
EXECUTE FUNCTION f_archive_booking();



-- Trigger 4: Insert a new Renting_Archive Tuple as soon as a given Renting gets deleted, presumably when customer's stay is over

CREATE FUNCTION f_archive_renting()
RETURNS TRIGGER AS $$
DECLARE
    f_name TEXT;
    l_name TEXT;

BEGIN
    SELECT first_name, last_name
    INTO f_name, l_name
    FROM Customer As c
    WHERE c.customer_ID = OLD.customer_ID;

    INSERT INTO Renting_Archive VALUES -- Note the NULL is a placeholder for the customer_feedback attribute
        (f_name, l_name, OLD.hotel_ID, OLD.room_num, OLD.start_date, OLD.end_date, NULL, OLD.check_in_emp_SIN);

    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER archive_renting
BEFORE DELETE ON Renting
FOR EACH ROW
EXECUTE FUNCTION f_archive_renting();



-- Trigger 5: Delete the booking as soon as a corresponding renting is made (which will in effect cause Trigger 3)

CREATE FUNCTION f_rent_in_effect()
RETURNS TRIGGER AS $$
BEGIN
    -- NEW in this case represents the inserted Renting tuple
    -- If there's no corresponding booking (ie customer just rented a room on the spot), then nothing gets deleted
    DELETE 
    FROM Booking AS b
    WHERE b.hotel_ID = NEW.hotel_ID AND b.room_num = NEW.room_num AND b.customer_ID = NEW.customer_ID AND b.start_date = NEW.start_date;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER rent_in_effect
AFTER INSERT ON Renting
FOR EACH ROW
EXECUTE FUNCTION f_rent_in_effect();



-- Trigger 6: Ensure no Booking_Archive tuples are made that don’t correspond to a Booking tuple

CREATE FUNCTION f_restrain_booking_archive()
RETURNS TRIGGER AS $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Booking AS b JOIN Customer AS c ON b.customer_ID = c.customer_ID
        WHERE c.first_name = NEW.cust_first_name 
        AND c.last_name = NEW.cust_last_name
        AND b.hotel_ID = NEW.hotel_ID
        AND b.room_num = NEW.room_num
        AND b.start_date = NEW.start_date) THEN
        RAISE EXCEPTION 'A non-existent booking cannot be archived.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER restrain_booking_archive
BEFORE INSERT ON Booking_Archive
FOR EACH ROW
EXECUTE FUNCTION f_restrain_booking_archive();



-- Trigger 7: Ensure no Renting_Archive tuples are made that don’t correspond to a Renting tuple

CREATE FUNCTION f_restrain_renting_archive()
RETURNS TRIGGER AS $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Renting AS b JOIN Customer AS c ON b.customer_ID = c.customer_ID
        WHERE c.first_name = NEW.cust_first_name 
        AND c.last_name = NEW.cust_last_name
        AND b.hotel_ID = NEW.hotel_ID
        AND b.room_num = NEW.room_num
        AND b.start_date = NEW.start_date) THEN
        RAISE EXCEPTION 'A non-existent renting cannot be archived.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER restrain_renting_archive
BEFORE INSERT ON Renting_Archive
FOR EACH ROW
EXECUTE FUNCTION f_restrain_renting_archive();



-- Trigger 8: Increment num_locations of a given chain when a hotel is added to that chain ======================================

CREATE FUNCTION f_inc_num_locations() 
RETURNS TRIGGER AS $$
BEGIN
    UPDATE Chain as c
    SET num_locations = num_locations + 1
    WHERE c.chain_name = NEW.chain_name;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER inc_num_locations
AFTER INSERT ON Hotel
FOR EACH ROW
EXECUTE FUNCTION f_inc_num_locations();



-- Trigger 9: Decrement num_locations of a given chain when a hotel is added to that chain ======================================

CREATE FUNCTION f_dec_num_locations() 
RETURNS TRIGGER AS $$
BEGIN
    UPDATE Chain as c
    SET num_locations = num_locations - 1
    WHERE c.chain_name = OLD.chain_name;

    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER dec_num_locations
BEFORE DELETE ON Hotel
FOR EACH ROW
EXECUTE FUNCTION f_dec_num_locations();



-- Modification Queries that could be useful for maintaining the integrity of the DB ================================================================

-- Query 1: DELETE all rentings where end_date has passed (ie end_date < current_date)
DELETE 
FROM Renting
WHERE end_date < CURRENT_DATE


-- Query 2: Set num_rooms in Hotel to the actual number of room tuples that belong to it in Room
UPDATE Hotel AS h
SET num_rooms = (SELECT COUNT(*)
	FROM Room AS r
	WHERE r.hotel_ID = h.hotel_ID);


-- Query 3: Set num_locations in Chain to the actual number of hotel tuples that belong to it in Hotel
UPDATE Chain AS c
SET num_locations = (SELECT COUNT(*)
	FROM Hotel AS h
	WHERE h.chain_name = c.chain_name);

	

