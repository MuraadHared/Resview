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

INSERT INTO Restaurant
VALUES
(DEFAULT, 'The Whalesbone Oyster House', 'Seafood', 'http://www.thewhalesbone.com/');
INSERT INTO Restaurant
VALUES
(DEFAULT, 'Hokkaido Sushi', 'Japanese', 'www.hokkaidosushiottawa.ca');
INSERT INTO Restaurant
VALUES
(DEFAULT, 'Host India', 'Indian', 'http://hostindia.ca');
INSERT INTO Restaurant
VALUES
(DEFAULT, 'Baan Thai', 'Thai', 'http://www.baanthairestaurantottawa.ca/');
INSERT INTO Restaurant
VALUES
(DEFAULT, 'Nando''s', 'Portugese', 'http://www.nandos.ca/');
INSERT INTO Restaurant
VALUES
(DEFAULT, 'Soca Kitchen & Pub', 'Spanish', 'http://www.socapub.com/');
INSERT INTO Restaurant
VALUES
(DEFAULT, 'Haveli', 'Indian', 'http://www.haveli.com/');
INSERT INTO Restaurant
VALUES
(DEFAULT, 'Mucho Burrito', 'Mexican', 'http://muchoburrito.com/');
INSERT INTO Restaurant
VALUES
(DEFAULT, 'Shawarma Prince', 'Middle Eastern', 'http://princegourmet.com/');
INSERT INTO Restaurant
VALUES
(DEFAULT, 'East Side Mario''s', 'Italian', 'http://www.eastsidemarios.com/');
INSERT INTO Restaurant
VALUES
(DEFAULT, 'Red Lobster', 'Seafood', 'http://www.redlobster.ca/');
INSERT INTO Restaurant
VALUES
(DEFAULT, 'Pho Thu Do', 'Vietnamese', 'http://phothudo.com/');
INSERT INTO Restaurant
VALUES
(DEFAULT, 'Vittoria Trattoria', 'Italian', 'https://www.vittoriatrattoria.com/');
INSERT INTO Restaurant
VALUES
(DEFAULT, 'Lone Star Texas Grill', 'Mexican', 'http://www.lonestartexasgrill.com/');
INSERT INTO Restaurant
VALUES
(DEFAULT, 'Silk Road Kabob House', 'Middle Eastern', 'http://silkroadkabobhouse.com/');
SELECT * FROM Restaurant;