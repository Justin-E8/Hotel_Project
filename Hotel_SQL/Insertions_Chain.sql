SET search_path = "Hotel";

INSERT INTO Chain VALUES							
    ('Marriott', 99, 'Broadway', 123, 'New York'),							
    ('Hilton', 80, 'Fifth Ave', 456, 'New York'),							
    ('Hyatt', 70, 'Queen St', 789, 'Toronto'),							
    ('Four Seasons', 80, 'Bay St', 101, 'Toronto'),							
    ('Best Western', 90, 'Sunset Blvd', 205, 'Los Angeles');							
							
INSERT INTO Chain_Phone VALUES							
    ('Marriott', '2125551234'),							
    ('Hilton', '2125555678'),							
    ('Hyatt', '4165559876'),							
    ('Four Seasons', '4165554321'),							
    ('Best Western', '3235552468');							
							
INSERT INTO Chain_Email VALUES							
    ('Marriott', 'contact@marriott.com'),							
    ('Hilton', 'contact@hilton.com'),							
    ('Hyatt', 'contact@hyatt.com'),							
    ('Four Seasons', 'contact@fourseasons.com'),							
    ('Best Western', 'contact@bestwestern.com');
