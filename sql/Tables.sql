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

CREATE TABLE Rating
(
	UserID INT,
	RestaurantID INT,
	Ratining_time TIMESTAMP,
	Comments TEXT,
	Price DECIMAL (1,1) CHECK (Price >= 0 AND Price <= 5),
	Food DECIMAL (1,1) CHECK (Food >= 0 AND Food <= 5),
	Mood DECIMAL (1,1) CHECK (Mood >= 0 AND Mood <= 5),
	Staff DECIMAL (1,1) CHECK (Staff >= 0 AND Staff <= 5),
	PRIMARY KEY (RestaurantID, UserID),
	FOREIGN KEY (UserID) REFERENCES Rater,            -- Question 1a
	FOREIGN KEY (RestaurantID) REFERENCES Restaurant)
);
		