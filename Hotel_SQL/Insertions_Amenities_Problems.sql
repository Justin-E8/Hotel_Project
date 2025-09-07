SET search_path = "Hotel";

-- Inserting Amenities
INSERT INTO Amenities VALUES 
    (100001, 101, 'Coffee Maker'),
    (100002, 203, 'Coffee Maker’'),
    (100003, 305, 'Balcony'),
    (100004, 404, 'Mini Fridge'),
    (100005, 502, 'Smart TV'),
    (100006, 601, 'Coffee Maker'),
    (100007, 705, 'Air Conditioning'),
    (100008, 803, 'Coffee Maker'),
    (200001, 102, 'Extra Storage'),
    (200002, 204, 'Mini Fridge'),
    (200003, 303, 'Pet Friendly'),
    (200004, 401, 'Balcony'),
    (200005, 505, 'Extra Storage'),
    (200006, 602, 'Lounge Chair'),
    (300001, 101, 'Rain Shower'),
    (300002, 205, 'Balcony'),
    (300003, 304, 'Mini Fridge'),
    (400001, 105, 'Balcony'),
    (500007, 701, 'Rain Shower'),
    (500008, 805, 'Extra Storage');

-- Inserting Problems
INSERT INTO Problems VALUES 
    (100001, 101, 'WiFi connectivity issues'),
    (100002, 202, 'Leaky faucet in the bathroom'),
    (100003, 303, 'Air conditioner not cooling properly'),
    (100004, 401, 'No hot water in the shower'),
    (100005, 503, 'TV remote not working'),
    (100006, 604, 'Leaky faucet in the bathroom'),
    (100007, 705, 'Flickering lights in the room'),
    (100008, 804, 'Bathroom door does not lock'),
    (200001, 103, 'Flickering lights in the room'),
    (200002, 205, 'Flickering lights in the room'),
    (200003, 302, 'Stained carpet'),
    (200004, 403, 'Broken electrical outlet'),
    (200005, 504, 'Room smells like smoke'),
    (200006, 601, 'Heating system not working'),
    (300001, 104, 'WiFi connectivity issues'),
    (300002, 203, 'No hot water in the shower'),
    (300003, 301, 'Mini fridge broken'),
    (400001, 102, 'Cracked window'),
    (500007, 703, 'WiFi connectivity issues'),
    (500008, 802, 'Stained carpet');
