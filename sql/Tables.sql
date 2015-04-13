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
	name varchar(50),
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
	password varchar (100),
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
	FOREIGN KEY (ItemID) REFERENCES MenuItem ON DELETE CASCADE
);