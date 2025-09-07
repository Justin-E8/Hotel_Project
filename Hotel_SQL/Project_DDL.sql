SET search_path = "Hotel";

CREATE TABLE Chain ( -- Note that chain is an SQL keyword; just ignore this
	chain_name VARCHAR(20) UNIQUE NOT NULL PRIMARY KEY,
	num_locations INT NOT NULL CHECK (num_locations BETWEEN 0 AND 999),
	central_street_name VARCHAR(20) NOT NULL,
	central_street_num INT NOT NULL CHECK (central_street_num BETWEEN 0 and 999),
	central_city VARCHAR(20) NOT NULL
);

CREATE TABLE Hotel (
	hotel_ID NUMERIC(6, 0) UNIQUE NOT NULL PRIMARY KEY,
	street_name VARCHAR(20) NOT NULL,
	street_num INT NOT NULL CHECK (street_num BETWEEN 0 and 999),
	city VARCHAR(20) NOT NULL,
	star_rating INT NOT NULL CHECK (star_rating BETWEEN 1 AND 5), 
	num_rooms INT NOT NULL CHECK (num_rooms BETWEEN 20 AND 999),
	manager_SIN CHAR(9), -- NOTE: Reference this to Employee later, keep null temporarily to avoid circular dependency issue
	chain_name VARCHAR(20) NOT NULL REFERENCES Chain ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Customer (
	customer_ID CHAR(6) UNIQUE NOT NULL CHECK (customer_ID ~ '^[0-9A-Za-z]{6}') PRIMARY KEY,
	date_registered DATE NOT NULL,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
	street_name VARCHAR(20) NOT NULL,
	street_num INT NOT NULL CHECK (street_num BETWEEN 0 and 999),
	city VARCHAR(20) NOT NULL
);

CREATE TABLE Employee (
	SIN CHAR(9) UNIQUE NOT NULL PRIMARY KEY CHECK (SIN ~ '^[0-9]{9}'),
	job_title VARCHAR(20) NOT NULL,
	date_hired DATE NOT NULL,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
	street_name VARCHAR(20) NOT NULL,
	street_num INT NOT NULL CHECK (street_num BETWEEN 0 AND 999),
	city VARCHAR(20) NOT NULL,
	hotel_ID NUMERIC(6, 0) NOT NULL REFERENCES Hotel ON DELETE CASCADE ON UPDATE CASCADE
);

-- Going back to Hotel table to ensure that manager_SIN is a FK to Employee
ALTER TABLE Hotel 
ADD CONSTRAINT fk_manager FOREIGN KEY (manager_SIN) REFERENCES Employee(SIN);

CREATE TABLE Room (
	hotel_ID NUMERIC(6, 0) NOT NULL REFERENCES Hotel ON DELETE CASCADE ON UPDATE CASCADE,
	room_num INT NOT NULL CHECK (room_num BETWEEN 100 AND 999),
	price NUMERIC(6, 2) NOT NULL,
	capacity INT NOT NULL CHECK (capacity BETWEEN 1 and 6),
	window_view VARCHAR(20) NOT NULL,
	is_extendable BOOLEAN NOT NULL,
	PRIMARY KEY(hotel_ID, room_num)
);

CREATE TABLE Booking (
	hotel_ID NUMERIC(6, 0) NOT NULL,
	room_num INT NOT NULL,
	customer_ID CHAR(6) NOT NULL REFERENCES Customer ON DELETE CASCADE ON UPDATE CASCADE,
	start_date DATE NOT NULL,
	end_date DATE NOT NULL,
	date_booking_made DATE NOT NULL,
	PRIMARY KEY (hotel_ID, room_num, customer_ID, start_date),
	FOREIGN KEY (hotel_ID, room_num) REFERENCES Room ON DELETE CASCADE ON UPDATE CASCADE
);

-- Adding constraint to ensure the dates make sense
ALTER TABLE Booking
ADD CONSTRAINT chk_booking_dates
CHECK (date_booking_made <= start_date AND start_date <= end_date);

CREATE TABLE Renting (
	hotel_ID NUMERIC(6, 0) NOT NULL,
	room_num INT NOT NULL,
	customer_ID CHAR(6) NOT NULL REFERENCES Customer ON DELETE CASCADE ON UPDATE CASCADE,
	start_date DATE NOT NULL,
	end_date DATE NOT NULL,
	check_in_emp_SIN CHAR(9) DEFAULT '000000000' REFERENCES Employee ON DELETE SET DEFAULT,
	PRIMARY KEY (hotel_ID, room_num, customer_ID, start_date),
	FOREIGN KEY (hotel_ID, room_num) REFERENCES Room ON DELETE CASCADE ON UPDATE CASCADE
);

-- Adding constraint to ensure the dates make sense
ALTER TABLE Renting
ADD CONSTRAINT chk_renting_dates
CHECK (start_date <= end_date);

-- No Foreign keys to Customer, Hotel, or Room to ensure archive stays even if they get deleted
CREATE TABLE Booking_Archive(
	cust_first_name VARCHAR(20) NOT NULL,
	cust_last_name VARCHAR(20) NOT NULL,
	hotel_ID NUMERIC(6, 0) NOT NULL,
	room_num INT NOT NULL,
	date_booking_made DATE NOT NULL,
	start_date DATE NOT NULL,
	end_date DATE NOT NULL,
	PRIMARY KEY (hotel_ID, room_num, start_date)
);

-- No Foreign keys to Customer, Hotel, Room, or Employee to ensure archive stays even if they get deleted
CREATE TABLE Renting_Archive(
	cust_first_name VARCHAR(20) NOT NULL,
	cust_last_name VARCHAR(20) NOT NULL,
	hotel_ID NUMERIC(6, 0) NOT NULL,
	room_num INT NOT NULL,
	start_date DATE NOT NULL,
	end_date DATE NOT NULL,
	customer_feedback VARCHAR(1000) DEFAULT 'No feedback',
	check_in_emp_SIN CHAR(9) NOT NULL CHECK (check_in_emp_SIN ~ '^[0-9]{9}'),
	PRIMARY KEY (hotel_ID, room_num, start_date)
);

CREATE TABLE Works_For (
	employee_SIN CHAR(9) NOT NULL REFERENCES Employee ON DELETE CASCADE ON UPDATE CASCADE,
	manager_SIN CHAR(9) NOT NULL REFERENCES Employee ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY(employee_SIN, manager_SIN)
);

CREATE TABLE Chain_Phone (
	chain_name VARCHAR(20) NOT NULL REFERENCES Chain ON DELETE CASCADE ON UPDATE CASCADE,
	phone_num CHAR(10) UNIQUE NOT NULL CHECK (phone_num ~ '^[0-9]{10}$'),
	PRIMARY KEY(chain_name, phone_num)
);

CREATE TABLE Hotel_Phone (
	hotel_ID NUMERIC(6, 0) NOT NULL REFERENCES Hotel ON DELETE CASCADE ON UPDATE CASCADE,
	phone_num CHAR(10) UNIQUE NOT NULL CHECK (phone_num ~ '^[0-9]{10}$'),
	PRIMARY KEY(hotel_ID, phone_num)
);

CREATE TABLE Chain_Email (
	chain_name VARCHAR(20) NOT NULL REFERENCES Chain ON DELETE CASCADE ON UPDATE CASCADE,
	email VARCHAR(50) UNIQUE NOT NULL CHECK (email ~ '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'),
	PRIMARY KEY(chain_name, email)
);

CREATE TABLE Hotel_Email (
	hotel_ID NUMERIC(6, 0) NOT NULL REFERENCES Hotel ON DELETE CASCADE ON UPDATE CASCADE,
	email VARCHAR(50) UNIQUE NOT NULL CHECK (email ~ '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'),
	PRIMARY KEY(hotel_ID, email)
);

CREATE TABLE Amenities (
	hotel_ID NUMERIC(6, 0) NOT NULL,
	room_num INT NOT NULL,
	amenity VARCHAR(20) NOT NULL,
	PRIMARY KEY(hotel_ID, room_num, amenity),
	FOREIGN KEY(hotel_ID, room_num) REFERENCES Room ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Problems (
	hotel_ID NUMERIC(6, 0) NOT NULL,
	room_num INT NOT NULL,
	problem VARCHAR(1000) NOT NULL,
	PRIMARY KEY(hotel_ID, room_num, problem),
	FOREIGN KEY(hotel_ID, room_num) REFERENCES Room ON DELETE CASCADE ON UPDATE CASCADE,
);