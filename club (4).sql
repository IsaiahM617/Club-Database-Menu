DROP database IF EXISTS club;
CREATE database club;
USE club;
CREATE TABLE admission (
    ConfirmationId INT NOT NULL auto_increment,
    GuestName VARCHAR (50) NOT NULL,
    Ad_Date DATE NOT NULL,
    Ticket_Price DECIMAL(4,2),
    Ticket_Status VARCHAR(7) NOT NULL,
    PRIMARY KEY (ConfirmationId)
);
CREATE TABLE list (
    ConfirmationId INT NOT NULL auto_increment,
    GuestName VARCHAR (50) NOT NULL,
    Ticket_Status VARCHAR(7) NOT NULL,
    Promo_Team VARCHAR(25) NULL,
    Additional_Guests VARCHAR(25),
    PRIMARY KEY (ConfirmationId)
);
CREATE TABLE section (
    ConfirmationId INT NOT NULL auto_increment,
    Section_Price DECIMAL (7,2) NOT NULL,
    Section_Size SMALLINT NOT NULL,
    Num_Bottles INT NOT NULL,
    Bottle_Price DECIMAL (5,2) NOT NULL,
    PRIMARY KEY (ConfirmationId)
);
CREATE TABLE guestAppearance (
    BookingId INT NOT NULL auto_increment,
    Celebrity_Name TEXT NOT NULL,
    Appearance_Date DATE NOT NULL,
    Additional_Guests VARCHAR(25),
    Email_Address TEXT NOT NULL,
    PRIMARY KEY (BookingId)
);
CREATE TABLE bottles (
    BottleId INT NOT NULL,
    Bottle_Price DECIMAL(7,2) NOT NULL,
    Bottle_Name VARCHAR(25),
    Bottle_Size INT,
    ChaserId INT,
    PRIMARY KEY (BottleId)
);
CREATE TABLE chasers (
    ChaserId INT NOT NULL,
    Chaser_Price DECIMAL(3,2) NOT NULL,
    Chaser_Type TEXT NOT NULL,
    BottleId INT NULL,
    PRIMARY KEY (ChaserId)
);
INSERT INTO admission (ConfirmationId, GuestName, Ad_Date, Ticket_Price, Ticket_Status) VALUES (NULL, 'Tyler Smith', 241124, 19.95, 'Express');
INSERT INTO admission (ConfirmationId, GuestName, Ad_Date, Ticket_Price, Ticket_Status) VALUES (NULL, 'Amy Patrice', 241124, 9.95, 'General');
INSERT INTO admission (ConfirmationId, GuestName, Ad_Date, Ticket_Price, Ticket_Status) VALUES (NULL, 'Woody Allen', 241124, 19.95, 'Express');
INSERT INTO admission (ConfirmationId, GuestName, Ad_Date, Ticket_Price, Ticket_Status) VALUES (NULL, 'Emma Johnson', 241124, 19.95, 'Express');
INSERT INTO admission (ConfirmationId, GuestName, Ad_Date, Ticket_Price, Ticket_Status) VALUES (NULL, 'Liam Brown', 241124, 9.95, 'General');
INSERT INTO admission (ConfirmationId, GuestName, Ad_Date, Ticket_Price, Ticket_Status) VALUES (NULL, 'Olivia Davis', 241124, 19.95, 'Express');
INSERT INTO admission (ConfirmationId, GuestName, Ad_Date, Ticket_Price, Ticket_Status) VALUES (NULL, 'Noah Wilson', 241124, 9.95, 'General');
INSERT INTO admission (ConfirmationId, GuestName, Ad_Date, Ticket_Price, Ticket_Status) VALUES (NULL, 'Sophia Martinez', 241124, 19.95, 'Express');

INSERT INTO list (ConfirmationId, GuestName, Ticket_Status, Promo_Team, Additional_Guests) VALUES (NULL,'Micheal Anders', 'List', 'OAF', NULL);
INSERT INTO list (ConfirmationId, GuestName, Ticket_Status, Promo_Team, Additional_Guests) VALUES (NULL,'Eddie Turner', 'List', 'Dream Marketing', NULL);
INSERT INTO list (ConfirmationId, GuestName, Ticket_Status, Promo_Team, Additional_Guests) VALUES (NULL,'Allen Baker', 'List', 'OAF', 3);
INSERT INTO list (ConfirmationId, GuestName, Ticket_Status, Promo_Team, Additional_Guests) VALUES (NULL, 'Sophia Wright', 'List', 'Elite Promotions', 2);
INSERT INTO list (ConfirmationId, GuestName, Ticket_Status, Promo_Team, Additional_Guests) VALUES (NULL, 'Liam Harper', 'List', 'Dream Marketing', 1);
INSERT INTO list (ConfirmationId, GuestName, Ticket_Status, Promo_Team, Additional_Guests) VALUES (NULL, 'Olivia Green', 'List', 'OAF', NULL);
INSERT INTO list (ConfirmationId, GuestName, Ticket_Status, Promo_Team, Additional_Guests) VALUES (NULL, 'Benjamin Carter', 'List', 'Top Talent Agency', 4);
INSERT INTO list (ConfirmationId, GuestName, Ticket_Status, Promo_Team, Additional_Guests) VALUES (NULL, 'Ella Brooks', 'List', 'Elite Promotions', NULL);
INSERT INTO list (ConfirmationId, GuestName, Ticket_Status, Promo_Team, Additional_Guests) VALUES (NULL, 'Noah Bennett', 'List', 'Dream Marketing', 2);
INSERT INTO list (ConfirmationId, GuestName, Ticket_Status, Promo_Team, Additional_Guests) VALUES (NULL, 'Charlotte Hill', 'List', 'OAF', 3);
INSERT INTO list (ConfirmationId, GuestName, Ticket_Status, Promo_Team, Additional_Guests) VALUES (NULL, 'William Adams', 'List', 'Elite Promotions', 1);
INSERT INTO list (ConfirmationId, GuestName, Ticket_Status, Promo_Team, Additional_Guests) VALUES (NULL, 'Amelia Reed', 'List', 'Dream Marketing', NULL);
INSERT INTO list (ConfirmationId, GuestName, Ticket_Status, Promo_Team, Additional_Guests) VALUES (NULL, 'James Cooper', 'List', 'OAF', 5);

INSERT INTO section (ConfirmationId, Section_Price, Section_Size, Num_Bottles, Bottle_Price) VALUES (NULL,500.00, 6, 2, 150.00);
INSERT INTO section (ConfirmationId, Section_Price, Section_Size, Num_Bottles, Bottle_Price) VALUES (NULL,700.00, 10, 4, 230.00);
INSERT INTO section (ConfirmationId, Section_Price, Section_Size, Num_Bottles, Bottle_Price) VALUES (NULL,900.00, 15, 6, 200.00);
INSERT INTO section (ConfirmationId, Section_Price, Section_Size, Num_Bottles, Bottle_Price) VALUES (NULL, 300.00, 4, 1, 120.00);
INSERT INTO section (ConfirmationId, Section_Price, Section_Size, Num_Bottles, Bottle_Price) VALUES (NULL, 1200.00, 20, 8, 250.00);
INSERT INTO section (ConfirmationId, Section_Price, Section_Size, Num_Bottles, Bottle_Price) VALUES (NULL, 450.00, 5, 2, 140.00);
INSERT INTO section (ConfirmationId, Section_Price, Section_Size, Num_Bottles, Bottle_Price) VALUES (NULL, 650.00, 8, 3, 215.00);
INSERT INTO section (ConfirmationId, Section_Price, Section_Size, Num_Bottles, Bottle_Price) VALUES (NULL, 1500.00, 25, 10, 300.00);
INSERT INTO section (ConfirmationId, Section_Price, Section_Size, Num_Bottles, Bottle_Price) VALUES (NULL, 1000.00, 18, 7, 280.00);
INSERT INTO section (ConfirmationId, Section_Price, Section_Size, Num_Bottles, Bottle_Price) VALUES (NULL, 750.00, 12, 5, 190.00);
INSERT INTO section (ConfirmationId, Section_Price, Section_Size, Num_Bottles, Bottle_Price) VALUES (NULL, 500.00, 6, 2, 175.00);
INSERT INTO section (ConfirmationId, Section_Price, Section_Size, Num_Bottles, Bottle_Price) VALUES (NULL, 350.00, 4, 1, 125.00);
INSERT INTO section (ConfirmationId, Section_Price, Section_Size, Num_Bottles, Bottle_Price) VALUES (NULL, 1800.00, 30, 12, 310.00);
INSERT INTO section (ConfirmationId, Section_Price, Section_Size, Num_Bottles, Bottle_Price) VALUES (NULL, 600.00, 9, 3, 200.00);
INSERT INTO section (ConfirmationId, Section_Price, Section_Size, Num_Bottles, Bottle_Price) VALUES (NULL, 400.00, 5, 2, 130.00);
INSERT INTO section (ConfirmationId, Section_Price, Section_Size, Num_Bottles, Bottle_Price) VALUES (NULL, 2200.00, 35, 15, 320.00);

INSERT INTO guestAppearance (BookingId, Celebrity_Name, Appearance_Date, Additional_Guests, Email_Address) VALUES (NULL,'Trey Songs', 240621, 9, 'trey_songs@gmail.com');
INSERT INTO guestAppearance (BookingId, Celebrity_Name, Appearance_Date, Additional_Guests, Email_Address) VALUES (NULL,'Megan Thee Stallion', 240809, 10, 'hotgirl1@gmail.com');
INSERT INTO guestAppearance (BookingId, Celebrity_Name, Appearance_Date, Additional_Guests, Email_Address) VALUES (NULL,'Doechii', 240430, 5, 'doechii@gmail.com');
INSERT INTO guestAppearance (BookingId, Celebrity_Name, Appearance_Date, Additional_Guests, Email_Address) VALUES (NULL, 'Drake', 241015, 8, 'drake_ovoxo@gmail.com');
INSERT INTO guestAppearance (BookingId, Celebrity_Name, Appearance_Date, Additional_Guests, Email_Address) VALUES (NULL, 'Beyoncé', 240920, 15, 'queenb@gmail.com');
INSERT INTO guestAppearance (BookingId, Celebrity_Name, Appearance_Date, Additional_Guests, Email_Address) VALUES (NULL, 'Cardi B', 241103, 12, 'cardib@gmail.com');
INSERT INTO guestAppearance (BookingId, Celebrity_Name, Appearance_Date, Additional_Guests, Email_Address) VALUES (NULL, 'Kendrick Lamar', 240725, 6, 'kendrick@gmail.com');
INSERT INTO guestAppearance (BookingId, Celebrity_Name, Appearance_Date, Additional_Guests, Email_Address) VALUES (NULL, 'Adele', 240601, 3, 'hello@gmail.com');
INSERT INTO guestAppearance (BookingId, Celebrity_Name, Appearance_Date, Additional_Guests, Email_Address) VALUES (NULL, 'Rihanna', 241213, 10, 'rihanna@gmail.com');
INSERT INTO guestAppearance (BookingId, Celebrity_Name, Appearance_Date, Additional_Guests, Email_Address) VALUES (NULL, 'The Weeknd', 241115, 7, 'theweeknd@gmail.com');
INSERT INTO guestAppearance (BookingId, Celebrity_Name, Appearance_Date, Additional_Guests, Email_Address) VALUES (NULL, 'Lizzo', 240830, 9, 'lizzo@gmail.com');
INSERT INTO guestAppearance (BookingId, Celebrity_Name, Appearance_Date, Additional_Guests, Email_Address) VALUES (NULL, 'Taylor Swift', 241010, 20, 'swiftie@gmail.com');
INSERT INTO guestAppearance (BookingId, Celebrity_Name, Appearance_Date, Additional_Guests, Email_Address) VALUES (NULL, 'Bruno Mars', 240815, 5, 'bruno@gmail.com');

INSERT INTO bottles (BottleId, Bottle_Name, Bottle_Price, Bottle_Size, ChaserId) VALUES (336, 'Grey Goose',75.00,25.4,226);
INSERT INTO bottles (BottleId, Bottle_Name, Bottle_Price, Bottle_Size, ChaserId) VALUES (337, 'Johnnie Walker',100.00,33.8,227);
INSERT INTO bottles (BottleId, Bottle_Name, Bottle_Price, Bottle_Size, ChaserId) VALUES (338, 'Patrón ',90.00,25.4,228);
INSERT INTO bottles (BottleId, Bottle_Name, Bottle_Price, Bottle_Size, ChaserId) VALUES (339, 'Hennessy',85.00, 25.4, 229);
INSERT INTO bottles (BottleId, Bottle_Name, Bottle_Price, Bottle_Size, ChaserId) VALUES (340, 'Jack Daniels',120.00, 33.8, 230);
INSERT INTO bottles (BottleId, Bottle_Name, Bottle_Price, Bottle_Size, ChaserId) VALUES (341, 'Bombay Sapphire',95.00, 25.4, 231);
INSERT INTO bottles (BottleId, Bottle_Name, Bottle_Price, Bottle_Size, ChaserId) VALUES (342, 'Bacardi',110.00, 50.7, 232);
INSERT INTO bottles (BottleId, Bottle_Name, Bottle_Price, Bottle_Size, ChaserId) VALUES (343, 'Makers Mark',75.50, 25.4, 233);
INSERT INTO bottles (BottleId, Bottle_Name, Bottle_Price, Bottle_Size, ChaserId) VALUES (344, 'Ciroc ',130.00, 33.8, 234);
INSERT INTO bottles (BottleId, Bottle_Name, Bottle_Price, Bottle_Size, ChaserId) VALUES (345, 'Don Julio',89.99, 25.4, 235);
INSERT INTO bottles (BottleId, Bottle_Name, Bottle_Price, Bottle_Size, ChaserId) VALUES (346, 'Chivas Regal',140.00, 50.7, 236);
INSERT INTO bottles (BottleId, Bottle_Name, Bottle_Price, Bottle_Size, ChaserId) VALUES (347, 'Captain Morgan',150.00, 33.8, 237);
INSERT INTO bottles (BottleId, Bottle_Name, Bottle_Price, Bottle_Size, ChaserId) VALUES (348, 'The Macallan',200.00, 50.7, 238);

INSERT INTO chasers (ChaserId, Chaser_Price, Chaser_Type, BottleId) VALUES (226, 30, 'Cranberry Juice', 336);
INSERT INTO chasers (ChaserId, Chaser_Price, Chaser_Type, BottleId) VALUES (227, 30, 'Orange Juice', 337);
INSERT INTO chasers (ChaserId, Chaser_Price, Chaser_Type, BottleId) VALUES (228, 25, 'Sprite', 338);
INSERT INTO chasers (ChaserId, Chaser_Price, Chaser_Type, BottleId) VALUES (229, 20, 'Tonic Water', 339);
INSERT INTO chasers (ChaserId, Chaser_Price, Chaser_Type, BottleId) VALUES (230, 35, 'Club Soda', 340);
INSERT INTO chasers (ChaserId, Chaser_Price, Chaser_Type, BottleId) VALUES (231, 25, 'Cola', 341);
INSERT INTO chasers (ChaserId, Chaser_Price, Chaser_Type, BottleId) VALUES (232, 28, 'Lemonade', 342);
INSERT INTO chasers (ChaserId, Chaser_Price, Chaser_Type, BottleId) VALUES (233, 30, 'Pineapple Juice', 343);
INSERT INTO chasers (ChaserId, Chaser_Price, Chaser_Type, BottleId) VALUES (234, 32, 'Ginger Ale', 344);
INSERT INTO chasers (ChaserId, Chaser_Price, Chaser_Type, BottleId) VALUES (235, 25, 'Iced Tea', 345);
INSERT INTO chasers (ChaserId, Chaser_Price, Chaser_Type, BottleId) VALUES (236, 40, 'Energy Drink', 346);
INSERT INTO chasers (ChaserId, Chaser_Price, Chaser_Type, BottleId) VALUES (237, 35, 'Watermelon Juice', 347);
INSERT INTO chasers (ChaserId, Chaser_Price, Chaser_Type, BottleId) VALUES (238, 45, 'Passion Fruit Juice', 348);
