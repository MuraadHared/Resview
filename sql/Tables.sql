DROP TABLE Restaurant, Location, MenuItem;

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
	email CHAR (20),
	name CHAR (15), 
	join_date DATE,
	type integer CHECK(integer >=1 AND integer <=5) DEFAULT 1,
	reputation CHAR (15)
); 