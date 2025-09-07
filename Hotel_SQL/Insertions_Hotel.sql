SET search_path = "Hotel";

-- Marriott Hotels							
INSERT INTO Hotel VALUES				
    (100001, 'Times Square', 1, 'New York', 5, 250, NULL, 'Marriott'),				
    (100002, '7th Ave', 150, 'New York', 4, 200, NULL, 'Marriott'),				
    (100003, 'Sunset Blvd', 300, 'Los Angeles', 5, 300, NULL, 'Marriott'),				
    (100004, 'King St', 200, 'Toronto', 3, 180, NULL, 'Marriott'),				
    (100005, 'Bay St', 500, 'Toronto', 4, 220, NULL, 'Marriott'),				
    (100006, 'Ocean Dr', 700, 'Miami', 5, 350, NULL, 'Marriott'),				
    (100007, 'Broad St', 100, 'Philadelphia', 4, 210, NULL, 'Marriott'),				
    (100008, 'Park Ave', 400, 'Chicago', 3, 180, NULL, 'Marriott');										

-- Marriot Hotels Managers							
INSERT INTO Employee VALUES					
    (111223344, 'Manager', '2021-06-15', 'Alexander', 'Miller', 'Broadway', 300, 'New York', 100001),					
    (222334455, 'Manager', '2019-07-20', 'Isabella', 'Williams', 'Park Ave', 150, 'New York', 100002),					
    (333445566, 'Manager', '2020-02-10', 'Benjamin', 'Garcia', 'Sunset Blvd', 100, 'Los Angeles', 100003),					
    (444556677, 'Manager', '2018-11-05', 'Charlotte', 'Lopez', 'King St', 200, 'Toronto', 100004),					
    (555667788, 'Manager', '2017-05-15', 'Lucas', 'Hernandez', 'Bay St', 500, 'Toronto', 100005),					
    (666778899, 'Manager', '2022-08-25', 'Zoe', 'Martinez', 'Ocean Dr', 700, 'Miami', 100006),					
    (777889900, 'Manager', '2021-09-10', 'James', 'Brown', 'Broad St', 100, 'Philadelphia', 100007),					
    (888990011, 'Manager', '2023-03-12', 'Mia', 'Davis', 'Park Ave', 400, 'Chicago', 100008);					

-- Updating Marriott Hotels with the correct manager SINs
UPDATE Hotel
SET manager_SIN = 111223344
WHERE hotel_ID = 100001;

UPDATE Hotel
SET manager_SIN = 222334455
WHERE hotel_ID = 100002;

UPDATE Hotel
SET manager_SIN = 333445566
WHERE hotel_ID = 100003;

UPDATE Hotel
SET manager_SIN = 444556677
WHERE hotel_ID = 100004;

UPDATE Hotel
SET manager_SIN = 555667788
WHERE hotel_ID = 100005;

UPDATE Hotel
SET manager_SIN = 666778899
WHERE hotel_ID = 100006;

UPDATE Hotel
SET manager_SIN = 777889900
WHERE hotel_ID = 100007;

UPDATE Hotel
SET manager_SIN = 888990011
WHERE hotel_ID = 100008;



-- Hilton Hotels							
INSERT INTO Hotel VALUES					
    (200001, 'Park Ave', 100, 'New York', 5, 300, NULL, 'Hilton'),							
    (200002, 'Broadway', 500, 'New York', 4, 250, NULL, 'Hilton'),							
    (200003, 'Sunset Blvd', 100, 'Los Angeles', 5, 350, NULL, 'Hilton'),							
    (200004, 'Queen St', 200, 'Toronto', 3, 180, NULL, 'Hilton'),							
    (200005, 'Bay St', 400, 'Toronto', 4, 230, NULL, 'Hilton'),							
    (200006, 'Collins Ave', 600, 'Miami', 5, 300, NULL, 'Hilton'),							
    (200007, 'Main St', 50, 'Philadelphia', 4, 200, NULL, 'Hilton'),							
    (200008, 'Elm St', 300, 'Chicago', 3, 160, NULL, 'Hilton');

-- Hilton Hotels Managers							
INSERT INTO Employee VALUES						
    (999011223, 'Manager', '2020-03-18', 'Michael', 'Johnson', 'Maple Ave', 100, 'Chicago', 200001),							
    (101112131, 'Manager', '2019-12-01', 'Olivia', 'Taylor', 'Pine St', 200, 'Chicago', 200002),							
    (202213141, 'Manager', '2021-07-25', 'Aiden', 'Clark', 'Ocean Blvd', 150, 'Los Angeles', 200003),							
    (303314151, 'Manager', '2018-04-10', 'Sophia', 'Rodriguez', 'Willow Dr', 400, 'Los Angeles', 200004),							
    (404415161, 'Manager', '2017-08-03', 'Liam', 'Martinez', 'Sunset Blvd', 700, 'Miami', 200005),							
    (505516171, 'Manager', '2022-01-14', 'Evelyn', 'Anderson', 'Elm St', 100, 'Miami', 200006),							
    (606617181, 'Manager', '2021-11-20', 'Jack', 'Thomas', 'Peachtree St', 300, 'Atlanta', 200007),							
    (707718191, 'Manager', '2019-10-07', 'Amelia', 'White', 'Bayside Dr', 500, 'Atlanta', 200008);

-- Updating Hilton Hotels with the correct manager SINs
UPDATE Hotel
SET manager_SIN = 999011223
WHERE hotel_ID = 200001;

UPDATE Hotel
SET manager_SIN = 101112131
WHERE hotel_ID = 200002;

UPDATE Hotel
SET manager_SIN = 202213141
WHERE hotel_ID = 200003;

UPDATE Hotel
SET manager_SIN = 303314151
WHERE hotel_ID = 200004;

UPDATE Hotel
SET manager_SIN = 404415161
WHERE hotel_ID = 200005;

UPDATE Hotel
SET manager_SIN = 505516171
WHERE hotel_ID = 200006;

UPDATE Hotel
SET manager_SIN = 606617181
WHERE hotel_ID = 200007;

UPDATE Hotel
SET manager_SIN = 707718191
WHERE hotel_ID = 200008;



-- Hyatt Hotels													
INSERT INTO Hotel VALUES						
    (300001, 'King St', 1, 'Toronto', 5, 250, NULL, 'Hyatt'),							
    (300002, 'Queen St', 150, 'Toronto', 4, 200, NULL, 'Hyatt'),							
    (300003, 'Market St', 500, 'New York', 5, 280, NULL, 'Hyatt'),							
    (300004, 'Broadway', 700, 'New York', 4, 220, NULL, 'Hyatt'),							
    (300005, 'Michigan Ave', 900, 'Chicago', 3, 180, NULL, 'Hyatt'),							
    (300006, 'Ocean Blvd', 800, 'Miami', 5, 320, NULL, 'Hyatt'),							
    (300007, 'Broadway St', 600, 'Los Angeles', 4, 250, NULL, 'Hyatt'),							
    (300008, 'Pacific Ave', 450, 'Los Angeles', 3, 200, NULL, 'Hyatt');	

-- Hyatt Hotels Managers							
INSERT INTO Employee VALUES					
    (808819202, 'Manager', '2021-06-15', 'Emma', 'Walker', 'King St', 1, 'Toronto', 300001),							
    (909920303, 'Manager', '2019-07-20', 'David', 'Moore', 'Queen St', 150, 'Toronto', 300002),							
    (101010111, 'Manager', '2020-02-10', 'Sophia', 'Perez', 'Market St', 500, 'New York', 300003),							
    (202020212, 'Manager', '2018-11-05', 'Olivia', 'Taylor', 'Broadway', 700, 'New York', 300004),							
    (303030313, 'Manager', '2017-05-15', 'Jackson', 'Rodriguez', 'Michigan Ave', 900, 'Chicago', 300005),							
    (404040414, 'Manager', '2022-08-25', 'Amelia', 'Lewis', 'Ocean Blvd', 800, 'Miami', 300006),							
    (505050515, 'Manager', '2021-09-10', 'Benjamin', 'Kim', 'Broadway St', 600, 'Los Angeles', 300007),							
    (606060616, 'Manager', '2023-03-12', 'Chloe', 'Hernandez', 'Pacific Ave', 450, 'Los Angeles', 300008);

-- Updating Hyatt Hotels with the correct manager SINs
UPDATE Hotel
SET manager_SIN = 808819202
WHERE hotel_ID = 300001;

UPDATE Hotel
SET manager_SIN = 909920303
WHERE hotel_ID = 300002;

UPDATE Hotel
SET manager_SIN = 101010111
WHERE hotel_ID = 300003;

UPDATE Hotel
SET manager_SIN = 202020212
WHERE hotel_ID = 300004;

UPDATE Hotel
SET manager_SIN = 303030313
WHERE hotel_ID = 300005;

UPDATE Hotel
SET manager_SIN = 404040414
WHERE hotel_ID = 300006;

UPDATE Hotel
SET manager_SIN = 505050515
WHERE hotel_ID = 300007;

UPDATE Hotel
SET manager_SIN = 606060616
WHERE hotel_ID = 300008;



-- Four Seasons Hotels							
INSERT INTO Hotel VALUES							
    (400001, 'Bay St', 100, 'Toronto', 5, 250, NULL, 'Four Seasons'),							
    (400002, 'Yonge St', 250, 'Toronto', 5, 300, NULL, 'Four Seasons'),							
    (400003, 'Collins Ave', 500, 'Miami', 5, 350, NULL, 'Four Seasons'),							
    (400004, 'Ocean Dr', 700, 'Miami', 4, 280, NULL, 'Four Seasons'),							
    (400005, 'King St', 300, 'Toronto', 4, 220, NULL, 'Four Seasons'),							
    (400006, 'Sunset Blvd', 600, 'Los Angeles', 5, 400, NULL, 'Four Seasons'),							
    (400007, 'Park Ave', 210, 'New York', 5, 320, NULL, 'Four Seasons'),							
    (400008, 'Fifth Ave', 400, 'New York', 4, 230, NULL, 'Four Seasons');

-- Four Seasons Managers						
INSERT INTO Employee VALUES							
    (707819202, 'Manager', '2020-01-15', 'John', 'Doe', 'Bay St', 100, 'Toronto', 400001),							
    (808920303, 'Manager', '2019-03-20', 'Jane', 'Smith', 'Yonge St', 250, 'Toronto', 400002),							
    (909021404, 'Manager', '2018-07-10', 'Carlos', 'Gomez', 'Collins Ave', 500, 'Miami', 400003),							
    (101112212, 'Manager', '2021-05-05', 'Maria', 'Rodriguez', 'Ocean Dr', 700, 'Miami', 400004),							
    (202223323, 'Manager', '2017-02-11', 'Michael', 'Johnson', 'King St', 300, 'Toronto', 400005),							
    (303334434, 'Manager', '2022-08-15', 'Laura', 'Williams', 'Sunset Blvd', 600, 'Los Angeles', 400006),							
    (404445545, 'Manager', '2016-04-22', 'David', 'Brown', 'Park Ave', 210, 'New York', 400007),							
    (505556646, 'Manager', '2023-06-30', 'Olivia', 'Jones', 'Fifth Ave', 400, 'New York', 400008);

-- Updating Four Seasons Hotels with the correct manager SINs
UPDATE Hotel
SET manager_SIN = 707819202
WHERE hotel_ID = 400001;

UPDATE Hotel
SET manager_SIN = 808920303
WHERE hotel_ID = 400002;

UPDATE Hotel
SET manager_SIN = 909021404
WHERE hotel_ID = 400003;

UPDATE Hotel
SET manager_SIN = 101112212
WHERE hotel_ID = 400004;

UPDATE Hotel
SET manager_SIN = 202223323
WHERE hotel_ID = 400005;

UPDATE Hotel
SET manager_SIN = 303334434
WHERE hotel_ID = 400006;

UPDATE Hotel
SET manager_SIN = 404445545
WHERE hotel_ID = 400007;

UPDATE Hotel
SET manager_SIN = 505556646
WHERE hotel_ID = 400008;




-- Best Western Hotels							
INSERT INTO Hotel VALUES							
    (500001, 'Main St', 50, 'Los Angeles', 3, 180, NULL, 'Best Western'),							
    (500002, 'Hollywood Blvd', 100, 'Los Angeles', 3, 200, NULL, 'Best Western'),							
    (500003, 'Main St', 200, 'Chicago', 3, 250, NULL, 'Best Western'),							
    (500004, 'State St', 300, 'Chicago', 2, 180, NULL, 'Best Western'),							
    (500005, 'Park Ave', 400, 'New York', 3, 220, NULL, 'Best Western'),							
    (500006, 'Broadway', 500, 'New York', 4, 240, NULL, 'Best Western'),							
    (500007, 'Ocean Ave', 600, 'Miami', 3, 200, NULL, 'Best Western'),							
    (500008, 'Collins Ave', 700, 'Miami', 4, 270, NULL, 'Best Western');

-- Managers for Best Western Hotels							
INSERT INTO Employee VALUES						
    (606667747, 'Manager', '2021-12-10', 'Andrew', 'Taylor', 'Main St', 50, 'Los Angeles', 500001),							
    (707778848, 'Manager', '2020-09-05', 'Jessica', 'Miller', 'Hollywood Blvd', 100, 'Los Angeles', 500002),							
    (808889949, 'Manager', '2018-11-25', 'Matthew', 'Davis', 'Main St', 200, 'Chicago', 500003),							
    (909900050, 'Manager', '2022-01-12', 'Emily', 'Martinez', 'State St', 300, 'Chicago', 500004),							
    (101112151, 'Manager', '2017-07-18', 'Ryan', 'Hernandez', 'Park Ave', 400, 'New York', 500005),							
    (202223262, 'Manager', '2021-03-23', 'Sophia', 'Clark', 'Broadway', 500, 'New York', 500006),							
    (303334373, 'Manager', '2020-05-01', 'Ethan', 'Rodriguez', 'Ocean Ave', 600, 'Miami', 500007),							
    (404445484, 'Manager', '2019-10-19', 'Ava', 'Martinez', 'Collins Ave', 700, 'Miami', 500008);	

-- Updating Best Western Hotels with the correct manager SINs
UPDATE Hotel
SET manager_SIN = 606667747
WHERE hotel_ID = 500001;

UPDATE Hotel
SET manager_SIN = 707778848
WHERE hotel_ID = 500002;

UPDATE Hotel
SET manager_SIN = 808889949
WHERE hotel_ID = 500003;

UPDATE Hotel
SET manager_SIN = 909900050
WHERE hotel_ID = 500004;

UPDATE Hotel
SET manager_SIN = 101112151
WHERE hotel_ID = 500005;

UPDATE Hotel
SET manager_SIN = 202223262
WHERE hotel_ID = 500006;

UPDATE Hotel
SET manager_SIN = 303334373
WHERE hotel_ID = 500007;

UPDATE Hotel
SET manager_SIN = 404445484
WHERE hotel_ID = 500008;
