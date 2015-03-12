DROP TABLE Restaurant, Location, MenuItem, Rater, Rating;

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
	open_date date,
	manager_name varchar(35),
	phone_number TEXT,
	street_address varchar(80),
	hour_open time,
	hour_close time,
	RestaurantID int REFERENCES Restaurant(RestaurantID) ON DELETE CASCADE
);

CREATE TABLE MenuItem
(
	ItemID serial PRIMARY KEY,
	name varchar(35),
	type varchar(15),
	category varchar(15),
	description varchar,
	price numeric(4, 2),
	RestaurantID int REFERENCES Restaurant(RestaurantID) ON DELETE CASCADE
);

CREATE TABLE Rater 
(	
	UserID serial PRIMARY KEY,
	email varchar (20),
	name varchar (15), 
	join_date date,
	type varchar(15),
	reputation numeric(1,1) CHECK(reputation >=1 AND reputation <=5) DEFAULT 1
); 

CREATE TABLE Rating
(
	UserID int,
	RestaurantID int,
	rating_time timestamp,
	comments text,
	price numeric(1, 1) CHECK (price >= 1 AND price <= 5),
	food numeric(1, 1) CHECK (food >= 1 AND food <= 5),
	mood numeric(1, 1) CHECK (mood >= 1 AND mood <= 5),
	staff numeric(1, 1) CHECK (staff >= 1 AND staff <= 5),
	PRIMARY KEY (RestaurantID, UserID),
	FOREIGN KEY (UserID) REFERENCES Rater,
	FOREIGN KEY (RestaurantID) REFERENCES Restaurant
);
		