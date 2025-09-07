SET search_path = "Hotel";

INSERT INTO Room VALUES 
    -- Rooms for hotel 100001 (Times Square)
    (100001, 101, 250.00, 2, 'Sea View', TRUE),
    (100001, 102, 300.00, 4, 'Mountain View', FALSE),
    (100001, 103, 275.00, 3, 'Sea View', TRUE),
    (100001, 104, 400.00, 5, 'Mountain View', FALSE),
    (100001, 105, 230.00, 1, 'Sea View', TRUE),

    -- Rooms for hotel 100002 (7th Ave)
    (100002, 201, 220.00, 2, 'Mountain View', TRUE),
    (100002, 202, 280.00, 6, 'Sea View', FALSE),
    (100002, 203, 260.00, 3, 'Mountain View', TRUE),
    (100002, 204, 310.00, 4, 'Sea View', FALSE),
    (100002, 205, 245.00, 5, 'Mountain View', TRUE),

    -- Rooms for hotel 100003 (Sunset Blvd)
    (100003, 301, 320.00, 1, 'Sea View', TRUE),
    (100003, 302, 290.00, 3, 'Mountain View', FALSE),
    (100003, 303, 400.00, 6, 'Sea View', TRUE),
    (100003, 304, 350.00, 4, 'Mountain View', FALSE),
    (100003, 305, 270.00, 2, 'Sea View', TRUE),

    -- Rooms for hotel 100004 (King St)
    (100004, 401, 200.00, 3, 'Mountain View', TRUE),
    (100004, 402, 230.00, 4, 'Sea View', FALSE),
    (100004, 403, 250.00, 6, 'Mountain View', TRUE),
    (100004, 404, 280.00, 1, 'Sea View', FALSE),
    (100004, 405, 210.00, 2, 'Mountain View', TRUE),

    -- Rooms for hotel 100005 (Bay St)
    (100005, 501, 310.00, 4, 'Sea View', TRUE),
    (100005, 502, 290.00, 3, 'Mountain View', FALSE),
    (100005, 503, 330.00, 2, 'Sea View', TRUE),
    (100005, 504, 380.00, 6, 'Mountain View', FALSE),
    (100005, 505, 270.00, 1, 'Sea View', TRUE),

    -- Rooms for hotel 100006 (Ocean Dr)
    (100006, 601, 420.00, 6, 'Mountain View', TRUE),
    (100006, 602, 400.00, 2, 'Sea View', FALSE),
    (100006, 603, 390.00, 3, 'Mountain View', TRUE),
    (100006, 604, 450.00, 5, 'Sea View', FALSE),
    (100006, 605, 360.00, 4, 'Mountain View', TRUE),

    -- Rooms for hotel 100007 (Broad St)
    (100007, 701, 270.00, 1, 'Sea View', TRUE),
    (100007, 702, 250.00, 6, 'Mountain View', FALSE),
    (100007, 703, 290.00, 4, 'Sea View', TRUE),
    (100007, 704, 310.00, 3, 'Mountain View', FALSE),
    (100007, 705, 260.00, 2, 'Sea View', TRUE),

    -- Rooms for hotel 100008 (Park Ave)
    (100008, 801, 230.00, 5, 'Mountain View', TRUE),
    (100008, 802, 260.00, 3, 'Sea View', FALSE),
    (100008, 803, 240.00, 6, 'Mountain View', TRUE),
    (100008, 804, 300.00, 2, 'Sea View', FALSE),
    (100008, 805, 210.00, 4, 'Mountain View', TRUE);



    -- Rooms for Hilton Hotels

INSERT INTO Room VALUES 
    -- Rooms for hotel 200001 (Park Ave)
    (200001, 101, 280.00, 3, 'Sea View', TRUE),
    (200001, 102, 320.00, 5, 'Mountain View', FALSE),
    (200001, 103, 290.00, 2, 'Sea View', TRUE),
    (200001, 104, 350.00, 6, 'Mountain View', FALSE),
    (200001, 105, 260.00, 4, 'Sea View', TRUE),

    -- Rooms for hotel 200002 (Broadway)
    (200002, 201, 310.00, 1, 'Mountain View', TRUE),
    (200002, 202, 340.00, 4, 'Sea View', FALSE),
    (200002, 203, 320.00, 3, 'Mountain View', TRUE),
    (200002, 204, 370.00, 5, 'Sea View', FALSE),
    (200002, 205, 300.00, 2, 'Mountain View', TRUE),

    -- Rooms for hotel 200003 (Sunset Blvd)
    (200003, 301, 400.00, 6, 'Sea View', TRUE),
    (200003, 302, 360.00, 2, 'Mountain View', FALSE),
    (200003, 303, 380.00, 3, 'Sea View', TRUE),
    (200003, 304, 420.00, 5, 'Mountain View', FALSE),
    (200003, 305, 340.00, 4, 'Sea View', TRUE),

    -- Rooms for hotel 200004 (Queen St)
    (200004, 401, 250.00, 3, 'Mountain View', TRUE),
    (200004, 402, 270.00, 4, 'Sea View', FALSE),
    (200004, 403, 290.00, 1, 'Mountain View', TRUE),
    (200004, 404, 310.00, 5, 'Sea View', FALSE),
    (200004, 405, 260.00, 6, 'Mountain View', TRUE),

    -- Rooms for hotel 200005 (Bay St)
    (200005, 501, 330.00, 2, 'Sea View', TRUE),
    (200005, 502, 310.00, 3, 'Mountain View', FALSE),
    (200005, 503, 360.00, 5, 'Sea View', TRUE),
    (200005, 504, 380.00, 6, 'Mountain View', FALSE),
    (200005, 505, 290.00, 4, 'Sea View', TRUE),

    -- Rooms for hotel 200006 (Collins Ave)
    (200006, 601, 410.00, 6, 'Mountain View', TRUE),
    (200006, 602, 390.00, 2, 'Sea View', FALSE),
    (200006, 603, 370.00, 4, 'Mountain View', TRUE),
    (200006, 604, 430.00, 5, 'Sea View', FALSE),
    (200006, 605, 350.00, 3, 'Mountain View', TRUE),

    -- Rooms for hotel 200007 (Main St)
    (200007, 701, 270.00, 3, 'Sea View', TRUE),
    (200007, 702, 250.00, 1, 'Mountain View', FALSE),
    (200007, 703, 290.00, 4, 'Sea View', TRUE),
    (200007, 704, 310.00, 5, 'Mountain View', FALSE),
    (200007, 705, 260.00, 6, 'Sea View', TRUE),

    -- Rooms for hotel 200008 (Elm St)
    (200008, 801, 230.00, 2, 'Mountain View', TRUE),
    (200008, 802, 260.00, 6, 'Sea View', FALSE),
    (200008, 803, 240.00, 4, 'Mountain View', TRUE),
    (200008, 804, 300.00, 3, 'Sea View', FALSE),
    (200008, 805, 210.00, 5, 'Mountain View', TRUE);



    -- Rooms for Hyatt Hotels

INSERT INTO Room VALUES 
    -- Rooms for hotel 300001 (King St)
    (300001, 101, 270.00, 2, 'Sea View', TRUE),
    (300001, 102, 320.00, 5, 'Mountain View', FALSE),
    (300001, 103, 290.00, 4, 'Sea View', TRUE),
    (300001, 104, 350.00, 6, 'Mountain View', FALSE),
    (300001, 105, 260.00, 3, 'Sea View', TRUE),

    -- Rooms for hotel 300002 (Queen St)
    (300002, 201, 310.00, 1, 'Mountain View', TRUE),
    (300002, 202, 340.00, 4, 'Sea View', FALSE),
    (300002, 203, 320.00, 3, 'Mountain View', TRUE),
    (300002, 204, 370.00, 5, 'Sea View', FALSE),
    (300002, 205, 300.00, 2, 'Mountain View', TRUE),

    -- Rooms for hotel 300003 (Market St)
    (300003, 301, 400.00, 6, 'Sea View', TRUE),
    (300003, 302, 360.00, 2, 'Mountain View', FALSE),
    (300003, 303, 380.00, 3, 'Sea View', TRUE),
    (300003, 304, 420.00, 5, 'Mountain View', FALSE),
    (300003, 305, 340.00, 4, 'Sea View', TRUE),

    -- Rooms for hotel 300004 (Broadway)
    (300004, 401, 250.00, 3, 'Mountain View', TRUE),
    (300004, 402, 270.00, 4, 'Sea View', FALSE),
    (300004, 403, 290.00, 1, 'Mountain View', TRUE),
    (300004, 404, 310.00, 5, 'Sea View', FALSE),
    (300004, 405, 260.00, 6, 'Mountain View', TRUE),

    -- Rooms for hotel 300005 (Michigan Ave)
    (300005, 501, 330.00, 2, 'Sea View', TRUE),
    (300005, 502, 310.00, 3, 'Mountain View', FALSE),
    (300005, 503, 360.00, 5, 'Sea View', TRUE),
    (300005, 504, 380.00, 6, 'Mountain View', FALSE),
    (300005, 505, 290.00, 4, 'Sea View', TRUE),

    -- Rooms for hotel 300006 (Ocean Blvd)
    (300006, 601, 410.00, 6, 'Mountain View', TRUE),
    (300006, 602, 390.00, 2, 'Sea View', FALSE),
    (300006, 603, 370.00, 4, 'Mountain View', TRUE),
    (300006, 604, 430.00, 5, 'Sea View', FALSE),
    (300006, 605, 350.00, 3, 'Mountain View', TRUE),

    -- Rooms for hotel 300007 (Broadway St)
    (300007, 701, 270.00, 3, 'Sea View', TRUE),
    (300007, 702, 250.00, 1, 'Mountain View', FALSE),
    (300007, 703, 290.00, 4, 'Sea View', TRUE),
    (300007, 704, 310.00, 5, 'Mountain View', FALSE),
    (300007, 705, 260.00, 6, 'Sea View', TRUE),

    -- Rooms for hotel 300008 (Pacific Ave)
    (300008, 801, 230.00, 2, 'Mountain View', TRUE),
    (300008, 802, 260.00, 6, 'Sea View', FALSE),
    (300008, 803, 240.00, 4, 'Mountain View', TRUE),
    (300008, 804, 300.00, 3, 'Sea View', FALSE),
    (300008, 805, 210.00, 5, 'Mountain View', TRUE);



    -- Rooms for Four Seasons Hotels

INSERT INTO Room VALUES 
    -- Rooms for hotel 400001 (Bay St)
    (400001, 101, 290.00, 2, 'Sea View', TRUE),
    (400001, 102, 330.00, 5, 'Mountain View', FALSE),
    (400001, 103, 310.00, 4, 'Sea View', TRUE),
    (400001, 104, 370.00, 6, 'Mountain View', FALSE),
    (400001, 105, 280.00, 3, 'Sea View', TRUE),

    -- Rooms for hotel 400002 (Yonge St)
    (400002, 201, 350.00, 1, 'Mountain View', TRUE),
    (400002, 202, 390.00, 4, 'Sea View', FALSE),
    (400002, 203, 370.00, 3, 'Mountain View', TRUE),
    (400002, 204, 420.00, 5, 'Sea View', FALSE),
    (400002, 205, 340.00, 2, 'Mountain View', TRUE),

    -- Rooms for hotel 400003 (Collins Ave)
    (400003, 301, 450.00, 6, 'Sea View', TRUE),
    (400003, 302, 410.00, 2, 'Mountain View', FALSE),
    (400003, 303, 430.00, 3, 'Sea View', TRUE),
    (400003, 304, 480.00, 5, 'Mountain View', FALSE),
    (400003, 305, 400.00, 4, 'Sea View', TRUE),

    -- Rooms for hotel 400004 (Ocean Dr)
    (400004, 401, 310.00, 3, 'Mountain View', TRUE),
    (400004, 402, 330.00, 4, 'Sea View', FALSE),
    (400004, 403, 350.00, 1, 'Mountain View', TRUE),
    (400004, 404, 370.00, 5, 'Sea View', FALSE),
    (400004, 405, 320.00, 6, 'Mountain View', TRUE),

    -- Rooms for hotel 400005 (King St)
    (400005, 501, 370.00, 2, 'Sea View', TRUE),
    (400005, 502, 350.00, 3, 'Mountain View', FALSE),
    (400005, 503, 400.00, 5, 'Sea View', TRUE),
    (400005, 504, 420.00, 6, 'Mountain View', FALSE),
    (400005, 505, 340.00, 4, 'Sea View', TRUE),

    -- Rooms for hotel 400006 (Sunset Blvd)
    (400006, 601, 490.00, 6, 'Mountain View', TRUE),
    (400006, 602, 470.00, 2, 'Sea View', FALSE),
    (400006, 603, 450.00, 4, 'Mountain View', TRUE),
    (400006, 604, 510.00, 5, 'Sea View', FALSE),
    (400006, 605, 430.00, 3, 'Mountain View', TRUE),

    -- Rooms for hotel 400007 (Park Ave)
    (400007, 701, 330.00, 3, 'Sea View', TRUE),
    (400007, 702, 310.00, 1, 'Mountain View', FALSE),
    (400007, 703, 350.00, 4, 'Sea View', TRUE),
    (400007, 704, 370.00, 5, 'Mountain View', FALSE),
    (400007, 705, 320.00, 6, 'Sea View', TRUE),

    -- Rooms for hotel 400008 (Fifth Ave)
    (400008, 801, 290.00, 2, 'Mountain View', TRUE),
    (400008, 802, 320.00, 6, 'Sea View', FALSE),
    (400008, 803, 310.00, 4, 'Mountain View', TRUE),
    (400008, 804, 370.00, 3, 'Sea View', FALSE),
    (400008, 805, 280.00, 5, 'Mountain View', TRUE);



    -- Rooms for Best Western Hotels

INSERT INTO Room VALUES 
    -- Rooms for hotel 500001 (Main St, Los Angeles)
    (500001, 101, 220.00, 2, 'Sea View', TRUE),
    (500001, 102, 260.00, 5, 'Mountain View', FALSE),
    (500001, 103, 240.00, 4, 'Sea View', TRUE),
    (500001, 104, 280.00, 6, 'Mountain View', FALSE),
    (500001, 105, 230.00, 3, 'Sea View', TRUE),

    -- Rooms for hotel 500002 (Hollywood Blvd, Los Angeles)
    (500002, 201, 270.00, 1, 'Mountain View', TRUE),
    (500002, 202, 310.00, 4, 'Sea View', FALSE),
    (500002, 203, 290.00, 3, 'Mountain View', TRUE),
    (500002, 204, 330.00, 5, 'Sea View', FALSE),
    (500002, 205, 280.00, 2, 'Mountain View', TRUE),

    -- Rooms for hotel 500003 (Main St, Chicago)
    (500003, 301, 350.00, 6, 'Sea View', TRUE),
    (500003, 302, 310.00, 2, 'Mountain View', FALSE),
    (500003, 303, 330.00, 3, 'Sea View', TRUE),
    (500003, 304, 370.00, 5, 'Mountain View', FALSE),
    (500003, 305, 290.00, 4, 'Sea View', TRUE),

    -- Rooms for hotel 500004 (State St, Chicago)
    (500004, 401, 240.00, 3, 'Mountain View', TRUE),
    (500004, 402, 260.00, 4, 'Sea View', FALSE),
    (500004, 403, 280.00, 1, 'Mountain View', TRUE),
    (500004, 404, 300.00, 5, 'Sea View', FALSE),
    (500004, 405, 250.00, 6, 'Mountain View', TRUE),

    -- Rooms for hotel 500005 (Park Ave, New York)
    (500005, 501, 310.00, 2, 'Sea View', TRUE),
    (500005, 502, 290.00, 3, 'Mountain View', FALSE),
    (500005, 503, 330.00, 5, 'Sea View', TRUE),
    (500005, 504, 350.00, 6, 'Mountain View', FALSE),
    (500005, 505, 280.00, 4, 'Sea View', TRUE),

    -- Rooms for hotel 500006 (Broadway, New York)
    (500006, 601, 380.00, 6, 'Mountain View', TRUE),
    (500006, 602, 360.00, 2, 'Sea View', FALSE),
    (500006, 603, 340.00, 4, 'Mountain View', TRUE),
    (500006, 604, 400.00, 5, 'Sea View', FALSE),
    (500006, 605, 320.00, 3, 'Mountain View', TRUE),

    -- Rooms for hotel 500007 (Ocean Ave, Miami)
    (500007, 701, 250.00, 3, 'Sea View', TRUE),
    (500007, 702, 230.00, 1, 'Mountain View', FALSE),
    (500007, 703, 270.00, 4, 'Sea View', TRUE),
    (500007, 704, 290.00, 5, 'Mountain View', FALSE),
    (500007, 705, 240.00, 6, 'Sea View', TRUE),

    -- Rooms for hotel 500008 (Collins Ave, Miami)
    (500008, 801, 220.00, 2, 'Mountain View', TRUE),
    (500008, 802, 250.00, 6, 'Sea View', FALSE),
    (500008, 803, 230.00, 4, 'Mountain View', TRUE),
    (500008, 804, 290.00, 3, 'Sea View', FALSE),
    (500008, 805, 210.00, 5, 'Mountain View', TRUE);