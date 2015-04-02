DROP TABLE Restaurant, Location, Rater, MenuItem, Rating, RatingItem;

CREATE TABLE Restaurant
(
	RestaurantID serial PRIMARY KEY,
	name varchar(35) NOT NULL,
	type varchar(15),
	url varchar	
);

CREATE TABLE Location
(	
	LocationID serial PRIMARY KEY,
	RestaurantID int,
	open_date date,
	manager_name varchar(35),
	phone_number TEXT,
	street_address varchar(80),
	hour_open time,
	hour_close time,
	FOREIGN KEY (RestaurantID) REFERENCES Restaurant ON DELETE CASCADE		
);

CREATE TABLE MenuItem
(
	ItemID serial PRIMARY KEY,
	RestaurantID int,
	name varchar(35),
	type varchar(15),
	category varchar(15),
	description varchar,
	price numeric(4, 2),
	FOREIGN KEY (RestaurantID) REFERENCES Restaurant ON DELETE CASCADE
);

CREATE TABLE Rater 
(	
	UserID serial PRIMARY KEY,
	email varchar (100),
	name varchar (15), 
	join_date date,
	type varchar(15),
	reputation numeric(2,1) CHECK(reputation >=1 AND reputation <=5) DEFAULT 1
); 

CREATE TABLE Rating
(
	UserID int,
	RestaurantID int,
	rating_time timestamp,
	comments text,
	price numeric(2, 1) CHECK (price >= 1 AND price <= 5),
	food numeric(2, 1) CHECK (food >= 1 AND food <= 5),
	mood numeric(2, 1) CHECK (mood >= 1 AND mood <= 5),
	staff numeric(2, 1) CHECK (staff >= 1 AND staff <= 5),
	PRIMARY KEY (rating_time, UserID),
	FOREIGN KEY (UserID) REFERENCES Rater ON DELETE CASCADE,	
	FOREIGN KEY (RestaurantID) REFERENCES Restaurant ON DELETE CASCADE
);

CREATE TABLE RatingItem
(	
	UserID int,
	ItemID int,
	rating_time timestamp,	
	rating numeric(2, 1) CHECK(rating >= 1 AND rating <= 5),
	rating_comment text,
	PRIMARY KEY (UserID, rating_time, ItemID),
	FOREIGN KEY (UserID) REFERENCES Rater ON DELETE CASCADE,	
	FOREIGN KEY (ItemID) REFERENCES MenuItem	
);


		

INSERT INTO Restaurant
VALUES
(DEFAULT, 'Restaurant 1', 'type-W', 'http://www.Restaurant-1.com/');
INSERT INTO Restaurant
VALUES
(DEFAULT, 'Restaurant 2', 'type-X', 'http://www.Restaurant-2.com/');
INSERT INTO Restaurant
VALUES
(DEFAULT, 'Restaurant 3', 'type-X', 'http://www.Restaurant-3.com/');
INSERT INTO Restaurant
VALUES
(DEFAULT, 'Restaurant 4', 'type-Y', 'http://www.Restaurant-4.com/');
INSERT INTO Restaurant
VALUES
(DEFAULT, 'Restaurant 5', 'type-Y', 'http://www.Restaurant-5.com/');
INSERT INTO Restaurant
VALUES
(DEFAULT, 'Restaurant 6', 'type-Z', 'http://www.Restaurant-6.com/');


INSERT INTO Rater
VALUES
(DEFAULT, 'A@uottawa.ca', 'User A', '2000-01-29', 'Food Critic', 1.0);
INSERT INTO Rater
VALUES
(DEFAULT, 'B@uottawa.ca', 'User B', '2001-02-28', 'Online', 2.0);
INSERT INTO Rater
VALUES
(DEFAULT, 'C@uottawa.ca', 'User C', '2002-03-27', 'Food Critic', 3.0);
INSERT INTO Rater
VALUES
(DEFAULT, 'D@uottawa.ca', 'User D', '2003-04-26', 'Blog', 4.0);
INSERT INTO Rater
VALUES
(DEFAULT, 'E@uottawa.ca', 'User E', '2004-05-25', 'Food Critic', 4.5);
INSERT INTO Rater
VALUES
(DEFAULT, 'F@uottawa.ca', 'User F', '2004-05-24', 'Food Critic', 5.0);

INSERT INTO Location
VALUES
(DEFAULT, 1, '2000-01-30', 'Manager A', '613-000-0001', '0001 Street Address', '01:00' , '01:00');

INSERT INTO Location
VALUES
(DEFAULT, 2, '2000-01-30', 'Manager B', '613-000-0002', '0002 Street Address', '02:00' , '02:00');

INSERT INTO Location
VALUES
(DEFAULT, 3, '2000-01-30', 'Manager C', '613-000-0003', '0003 Street Address', '03:00' , '03:00');

INSERT INTO Location
VALUES
(DEFAULT, 4, '2000-01-30', 'Manager D', '613-000-0004', '0004 Street Address', '04:00' , '04:00');

INSERT INTO Location
VALUES
(DEFAULT, 5, '2000-01-30', 'Manager E', '613-000-0005', '0005 Street Address', '05:00' , '04:00');

INSERT INTO Location
VALUES
(DEFAULT, 6, '2000-01-30', 'Manager F', '613-000-0006', '0006 Street Address', '06:00' , '06:00');



-- Tpye W -- 6 in total
INSERT INTO Rating
VALUES
('1','1','2013-03-20 06:11:03','PLACEHOLDER',1.4,1.2,1.1,1.6);
INSERT INTO Rating
VALUES
('1','1','2013-03-21 09:11:03','PLACEHOLDER',0.4,0.2,0.0,0.6);
INSERT INTO Rating
VALUES
('1','1','2013-03-21 12:11:03','PLACEHOLDER',0.4,0.2,0.7,0.6);
INSERT INTO Rating
VALUES
('1','1','2013-03-21 10:11:03','PLACEHOLDER',0.4,0.2,0.2,0.6);
INSERT INTO Rating
VALUES
('1','1','2013-03-21 11:11:03','PLACEHOLDER',0.4,0.2,0.9,0.6);
INSERT INTO Rating
VALUES
('6','1','2013-03-21 10:11:03','PLACEHOLDER',0.4,0.2,0.5,0.6);


-- Type X -- 14 in total
INSERT INTO Rating
VALUES
('1','2','2013-03-22 10:11:03','PLACEHOLDER',0.4,0.9,0.5,0.6);
INSERT INTO Rating
VALUES
('5','2','2013-03-23 10:11:03','PLACEHOLDER',3.4,4.2,3.0,1.6);

INSERT INTO Rating
VALUES
('1','3','2013-03-24 10:11:36','PLACEHOLDER',0.4,0.2,0.6,0.6);
INSERT INTO Rating
VALUES
('2','3','2013-03-25 10:11:26','PLACEHOLDER',3.4,4.2,3.0,1.6);
INSERT INTO Rating
VALUES
('3','3','2013-03-24 10:11:39','PLACEHOLDER',3.4,4.2,3.0,1.6);
INSERT INTO Rating
VALUES
('4','3','2013-03-25 10:11:40','PLACEHOLDER',3.4,4.2,3.0,1.6);
INSERT INTO Rating
VALUES
('5','3','2013-03-24 10:11:41','PLACEHOLDER',3.4,4.2,3.0,1.6);
INSERT INTO Rating
VALUES
('6','3','2013-03-25 10:11:45','PLACEHOLDER',3.4,4.2,3.0,1.6);
INSERT INTO Rating
VALUES
('1','3','2013-03-24 10:11:34','PLACEHOLDER',0.5,0.8,0.2,0.6);
INSERT INTO Rating
VALUES
('2','3','2013-03-25 10:11:18','PLACEHOLDER',3.4,4.2,3.0,1.6);
INSERT INTO Rating
VALUES
('3','3','2013-03-24 10:11:10','PLACEHOLDER',3.4,4.2,3.0,1.6);
INSERT INTO Rating
VALUES
('4','3','2013-03-25 10:11:56','PLACEHOLDER',3.4,4.2,3.0,1.6);
INSERT INTO Rating
VALUES
('5','3','2013-03-24 10:11:23','PLACEHOLDER',3.4,4.2,3.0,1.6);
INSERT INTO Rating
VALUES
('6','3','2013-03-25 10:11:12','PLACEHOLDER',3.4,4.2,3.0,1.6);






-- Type Y -- 6 in total 
INSERT INTO Rating
VALUES
('3','4','2013-03-18 10:11:03','PLACEHOLDER',3.4,4.2,3.0,1.6);
INSERT INTO Rating
VALUES
('6','4','2013-03-17 10:11:03','PLACEHOLDER',3.4,4.2,3.0,1.6);

INSERT INTO Rating
VALUES
('3','5','2013-03-16 10:11:03','PLACEHOLDER',3.4,4.2,3.0,1.6);
INSERT INTO Rating
VALUES
('5','5','2013-03-15 10:11:03','PLACEHOLDER',3.4,4.2,3.0,1.6);
INSERT INTO Rating
VALUES
('5','5','2012-03-15 10:11:03','PLACEHOLDER',3.4,4.2,3.0,1.6);
INSERT INTO Rating
VALUES
('5','5','2011-03-15 10:11:03','PLACEHOLDER',3.4,4.2,3.0,1.6);



-- Type Z -- 2 in total
INSERT INTO Rating
VALUES
('2','6','2013-03-14 10:11:03','PLACEHOLDER',3.4,4.2,3.0,1.6);
INSERT INTO Rating
VALUES
('1','6','2013-03-13 10:11:03','PLACEHOLDER',0.4,0.2,0.1,0.6);