SET search_path = "Hotel";

-- Marriott Employees
INSERT INTO Employee VALUES 
    ('111223345', 'Front Desk', '2024-06-18', 'George', 'Taylor', 'Times Square', 1, 'New York', 100001),
    ('222334456', 'Front Desk', '2024-10-20', 'Helen', 'Anderson', '7th Ave', 150, 'New York', 100002),
    ('333445567', 'Front Desk', '2024-07-25', 'Irene', 'Thomas', 'Sunset Blvd', 300, 'Los Angeles', 100003),
    ('444556678', 'Front Desk', '2024-11-09', 'Jack', 'Jackson', 'King St', 200, 'Toronto', 100004),
    ('555667789', 'Front Desk', '2025-01-16', 'Karen', 'White', 'Bay St', 500, 'Toronto', 100005),
    ('666778900', 'Front Desk', '2024-12-02', 'Louis', 'Harris', 'Ocean Dr', 700, 'Miami', 100006),
    ('777889901', 'Front Desk', '2024-05-29', 'Maria', 'Clark', 'Broad St', 100, 'Philadelphia', 100007),
    ('888990012', 'Front Desk', '2024-08-30', 'Nancy', 'Lewis', 'Park Ave', 400, 'Chicago', 100008);

-- Hilton Employees
INSERT INTO Employee VALUES 
    ('999011224', 'Front Desk', '2025-02-22', 'Oscar', 'Young', 'Park Ave', 100, 'New York', 200001),
    ('101112132', 'Front Desk', '2024-06-12', 'Paul', 'Martinez', 'Broadway', 500, 'New York', 200002),
    ('202213142', 'Front Desk', '2024-09-04', 'Quinn', 'Garcia', 'Sunset Blvd', 100, 'Los Angeles', 200003),
    ('303314152', 'Front Desk', '2024-10-07', 'Rachel', 'Martinez', 'Queen St', 200, 'Toronto', 200004),
    ('404415162', 'Front Desk', '2025-01-05', 'Samuel', 'Rodriguez', 'Bay St', 400, 'Toronto', 200005),
    ('505516172', 'Front Desk', '2024-07-18', 'Tina', 'Perez', 'Collins Ave', 600, 'Miami', 200006),
    ('606617182', 'Front Desk', '2024-09-17', 'Uma', 'Lewis', 'Main St', 50, 'Philadelphia', 200007),
    ('707718192', 'Front Desk', '2025-01-25', 'Vera', 'Walker', 'Elm St', 300, 'Chicago', 200008);

-- Hyatt Employees
INSERT INTO Employee VALUES 
    ('808819203', 'Front Desk', '2024-07-22', 'Will', 'Allen', 'King St', 1, 'Toronto', 300001),
    ('909920304', 'Front Desk', '2024-09-29', 'Xander', 'King', 'Queen St', 150, 'Toronto', 300002),
    ('101010112', 'Front Desk', '2024-06-30', 'Yara', 'Scott', 'Market St', 500, 'New York', 300003),
    ('202020213', 'Front Desk', '2024-11-14', 'Zane', 'Green', 'Broadway', 700, 'New York', 300004),
    ('303030314', 'Front Desk', '2024-12-19', 'Adam', 'Nelson', 'Michigan Ave', 900, 'Chicago', 300005),
    ('404040415', 'Front Desk', '2024-08-10', 'Ben', 'Carter', 'Ocean Blvd', 800, 'Miami', 300006),
    ('505050516', 'Front Desk', '2024-10-11', 'Clara', 'Mitchell', 'Broadway St', 600, 'Los Angeles', 300007),
    ('606060617', 'Front Desk', '2025-01-13', 'Daniel', 'Roberts', 'Pacific Ave', 450, 'Los Angeles', 300008);

-- Four Seasons Employees
INSERT INTO Employee VALUES 
    ('707819201', 'Front Desk', '2024-07-15', 'John', 'Doe', 'Bay St', 100, 'Toronto', 400001),
    ('808920302', 'Front Desk', '2024-11-02', 'Jane', 'Smith', 'Yonge St', 250, 'Toronto', 400002),
    ('909021405', 'Front Desk', '2025-01-10', 'Alice', 'Johnson', 'Collins Ave', 500, 'Miami', 400003),
    ('101112213', 'Front Desk', '2024-09-23', 'Bob', 'Williams', 'Ocean Dr', 700, 'Miami', 400004),
    ('202223324', 'Front Desk', '2025-02-11', 'Charlie', 'Brown', 'King St', 300, 'Toronto', 400005),
    ('303334435', 'Front Desk', '2024-08-05', 'David', 'Davis', 'Sunset Blvd', 600, 'Los Angeles', 400006),
    ('404445546', 'Front Desk', '2025-03-01', 'Emily', 'Miller', 'Park Ave', 210, 'New York', 400007),
    ('505556647', 'Front Desk', '2024-12-14', 'Frank', 'Wilson', 'Fifth Ave', 400, 'New York', 400008);


-- Best Western Employees
INSERT INTO Employee VALUES 
    ('606667748', 'Front Desk', '2024-05-25', 'Eva', 'Hall', 'Main St', 50, 'Los Angeles', 500001),
    ('707778849', 'Front Desk', '2024-08-14', 'Felix', 'Allen', 'Hollywood Blvd', 100, 'Los Angeles', 500002),
    ('808889950', 'Front Desk', '2024-07-07', 'Gina', 'Perez', 'Main St', 200, 'Chicago', 500003),
    ('909900051', 'Front Desk', '2024-09-01', 'Hannah', 'Cameron', 'State St', 300, 'Chicago', 500004),
    ('101112152', 'Front Desk', '2024-06-05', 'Ivy', 'Young', 'Park Ave', 400, 'New York', 500005),
    ('202223263', 'Front Desk', '2024-10-20', 'Jackie', 'Martin', 'Broadway', 500, 'New York', 500006),
    ('303334374', 'Front Desk', '2025-02-01', 'Kyle', 'Walker', 'Ocean Ave', 600, 'Miami', 500007),
    ('404445485', 'Front Desk', '2024-12-09', 'Lily', 'Baker', 'Collins Ave', 700, 'Miami', 500008);


-- Inserting data into Works_For for each pair of manager and employee
INSERT INTO Works_For VALUES
    ('111223345', '111223344'),
    ('222334456', '222334455'),
    ('333445567', '333445566'),
    ('444556678', '444556677'),
    ('555667789', '555667788'),
    ('666778900', '666778899'),
    ('777889901', '777889900'),
    ('888990012', '888990011'),
    ('999011224', '999011223'),
    ('101112132', '101112131'),
    ('202213142', '202213141'),
    ('303314152', '303314151'),
    ('404415162', '404415161'),
    ('505516172', '505516171'),
    ('606617182', '606617181'),
    ('707718192', '707718191'),
    ('808819203', '808819202'),
    ('909920304', '909920303'),
    ('101010112', '101010111'),
    ('202020213', '202020212'),
    ('303030314', '303030313'),
    ('404040415', '404040414'),
    ('505050516', '505050515'),
    ('606060617', '606060616'),
    ('707819201', '707819202'),
    ('808920302', '808920303'),
    ('909021405', '909021404'),
    ('101112213', '101112212'),
    ('202223324', '202223323'),
    ('303334435', '303334434'),
    ('404445546', '404445545'),
    ('505556647', '505556646'),
    ('606667748', '606667747'),
    ('707778849', '707778848'),
    ('808889950', '808889949'),
    ('909900051', '909900050'),
    ('101112152', '101112151'),
    ('202223263', '202223262'),
    ('303334374', '303334373'),
    ('404445485', '404445484');
