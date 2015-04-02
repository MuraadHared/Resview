
/***Add Restaurants**/
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


/***Add Raters**/
INSERT INTO Rater
VALUES
(DEFAULT, 'mhare095@uottawa.ca', 'HungryCritic', '2012-11-26', 'Food Critic', 3);
INSERT INTO Rater
VALUES
(DEFAULT, 'shash034@uottawa.ca', 'SarmadTheRater', '2014-02-05', 'Online', 1);
INSERT INTO Rater
VALUES
(DEFAULT, 'someguy54@uottawa.ca', 'SomeGuy', '2013-01-03', 'Food Critic', 4);
INSERT INTO Rater
VALUES
(DEFAULT, 'somegirl65@uottawa.ca', 'SomeGirl', '2012-05-24', 'Blog', 2.5);
INSERT INTO Rater
VALUES
(DEFAULT, 'test58@uottawa.ca', 'FoodTester', '2013-11-26', 'Food Critic', 2.9);
INSERT INTO Rater
VALUES
(DEFAULT, 'srana056@uottawa.ca', 'ILoveFood', '2014-03-08', 'Food Critic', 3.4);
INSERT INTO Rater
VALUES
(DEFAULT, 'lovefood23@uottawa.ca', 'AnyCuisineLover', '2014-12-01', 'Food Critic', 2.1);
INSERT INTO Rater
VALUES
(DEFAULT, 'johnny146@uottawa.ca', 'Johnny146', '2012-11-26', 'Online', 3.2);
INSERT INTO Rater
VALUES
(DEFAULT, 'michael15@uottawa.ca', 'Michael15', '2012-11-02', 'Online', 3.8);
INSERT INTO Rater
VALUES
(DEFAULT, 'rana41@uottawa.ca', 'Rana41', '2013-07-08', 'Online', 3.7);
INSERT INTO Rater
VALUES
(DEFAULT, 'kim52@uottawa.ca', 'Kim52', '2013-02-01', 'Online', 2.5);
INSERT INTO Rater
VALUES
(DEFAULT, 'mario23@uottawa.ca', 'Mario23', '2015-03-12', 'Online', 1.9);
INSERT INTO Rater
VALUES
(DEFAULT, 'bistrolover@uottawa.ca', 'BistroLover', '2014-06-07', 'Blog', 1.2);
INSERT INTO Rater
VALUES
(DEFAULT, 'foodfiend451@uottawa.ca', 'FoodFiend451', '2014-08-10', 'Blog', 4.5);
INSERT INTO Rater
VALUES
(DEFAULT, 'sweetooth657@uottawa.ca', 'SweetTooth657', '2013-09-10', 'Blog', 4.1);



/***Add Ratings of Restaurants**/
INSERT INTO Rating
VALUES
(1, 1, '2014-01-01 13:01:01', 'Greatest seafood restaurant in Ottawa!', 3.4, 4.3, 4.5, 4.5);
INSERT INTO Rating
VALUES
(2, 1, '2014-08-23 15:25:54', 'Great!', 1.8, 2.2, 3.9, 4.1);
INSERT INTO Rating
VALUES
(3, 1, '2013-12-05 09:30:25', 'Really overhyped. I hated it.', 1.2, 1, 1, 1);
INSERT INTO Rating
VALUES
(4, 1, '2014-01-01 10:29:25', 'It has potential but it''s not there yet.', 1.2, 2.3, 2.1, 2.3);
INSERT INTO Rating
VALUES
(4, 1, '2014-01-02 13:52:21', 'Changed my mind. I just had one bad experience. It''s amazing!', 4.2, 3.9, 4.5, 4.9);
INSERT INTO Rating
VALUES
(7, 1, '2014-12-17 11:45:30', 'This is like a second home to me.', 1.2, 2.3, 4.5, 4.6);
INSERT INTO Rating
VALUES
(9, 1, '2014-01-29 14:25:01', 'Exceptional service!', 4.2, 4.3, 4.4, 4.5);
INSERT INTO Rating
VALUES
(1, 1, '2014-02-05 16:53:21', 'Went again and still the greatest seafood restaurant in Ottawa! I actually like it more now!', 3.5, 4.5, 4.5, 4.6);
	

INSERT INTO Rating
VALUES
(1, 2, '2013-07-25 17:29:21', 'Excellent!', 3.9, 4.1, 3.8, 4.5);
INSERT INTO Rating
VALUES
(9, 2, '2013-07-15 13:01:01', 'Thumbs down. :(', 1.2, 1.5, 1.2, 3.5);
INSERT INTO Rating
VALUES
(14, 2, '2014-08-23 20:12:11', 'I love their all you can eat!', 1.2, 2.3, 2.1, 2.6);
INSERT INTO Rating
VALUES
(12, 2, '2015-03-13 19:20:19', 'Very interesting atmosphere.', 1.2, 2.5, 1.2, 4.5);
INSERT INTO Rating
VALUES
(13, 2, '2015-04-01 18:14:14', 'Hokkaido all the way!', 4.5, 4.3, 4.9, 4.2);
INSERT INTO Rating
VALUES
(6, 2, '2015-02-18 12:01:48', 'The best all you can eat sushi restaurant in Ottawa.', 5, 5, 5, 5);
INSERT INTO Rating
VALUES
(7, 2, '2014-12-20 15:25:57', 'Amazing service. I made sure to give the servers a big tip!', 1.2, 2.3, 4.5, 3.5);
INSERT INTO Rating
VALUES
(8, 2, '2014-01-01 17:52:23', 'Creative layout and excellent service!', 3.9, 3.6, 3.3, 3.5);


INSERT INTO Rating
VALUES
(1, 3, '2012-11-27 15:52:25', 'Felt like I was at home in India!', 4.5, 4.3, 4.5, 2.3);
INSERT INTO Rating
VALUES
(7, 3, '2015-03-22 09:53:15', 'Expensive but otherwise excellent.', 1.3, 4.3, 4.5, 4.7);
INSERT INTO Rating
VALUES
(2, 3, '2014-02-23 10:42:12', 'Really pricey. The food was great though.', 1.7, 4.1, 4.5, 3.7);
INSERT INTO Rating
VALUES
(5, 3, '2014-04-10 11:43:10', 'My favourite Indian restaurant by far.', 2.3, 3.9, 4.5, 3.5);
INSERT INTO Rating
VALUES
(4, 3, '2015-07-10 21:23:11', 'I''ve always loved Indian food. This made me love it even more.', 2.9, 3.6, 4.5, 3.8);
INSERT INTO Rating
VALUES
(3, 3, '2014-09-10 20:53:15', 'Not that great.', 2.8, 2.2, 2.5, 2.2);
INSERT INTO Rating
VALUES
(14, 3, '2014-10-15 16:27:32', 'Great atmosphere and food.', 2.5, 2.3, 2.9, 2.4);
INSERT INTO Rating
VALUES
(5, 3, '2014-12-25 17:57:52', 'I''ve gone back around ten times now!', 3.9, 4.5, 4.5, 4.9);



INSERT INTO Rating
VALUES
(1, 4, '2015-03-12 18:29:32', 'Best pad thai chicken!', 2.2, 2.3, 3.6, 4.1);
INSERT INTO Rating
VALUES
(2, 4, '2014-05-17 17:36:37', 'Great service. Food was made in under 10 minutes.', 4.2, 2.3, 3.7, 4.2);
INSERT INTO Rating
VALUES
(2, 4, '2015-06-16 13:01:01', 'Waiter served me with a smile. But the quality has went down since last time.', 3.1, 2.3, 2.8, 1.2);
INSERT INTO Rating
VALUES
(6, 4, '2014-07-23 11:30:27', 'My favourite thai food restaurant.', 4.2, 2.4, 4.9, 4.7);
INSERT INTO Rating
VALUES
(7, 4, '2015-11-08 16:17:54', 'Kind of expensive but otherwise excellent.', 2.5, 3.9,  3.7, 3.1);
INSERT INTO Rating
VALUES
(10, 4, '2015-03-24 10:26:28', 'The atmosphere made me feel amazing as I left.', 3.6, 2.3, 5.0, 2.4);
INSERT INTO Rating
VALUES
(11, 4, '2013-08-12 22:57:10', 'Worst food, mood and price!', 1.1, 2.2, 1.1, 3.8);
INSERT INTO Rating
VALUES
(13, 4, '2014-10-02 15:35:29', 'The menu was a bit pricey.', 1.4, 2.9, 4.3, 4.1);


INSERT INTO Rating
VALUES
(1, 5, '2013-11-23 16:17:54', 'The staff wasn''t that great and it was really expensive.', 2.5, 2.9,  4.7, 2.1);
INSERT INTO Rating
VALUES
(7, 5, '2015-03-16 10:26:28', 'Great music.', 4.6, 5.0, 5.0, 2.1);
INSERT INTO Rating
VALUES
(15, 5, '2013-08-17 22:57:10', 'This is crap.', 3.0, 3.0, 3.0, 3.0);
INSERT INTO Rating
VALUES
(4, 5, '2014-10-22 15:35:29', 'Great vegetarian menu.', 4.9, 3.9, 4.3, 3.1);
INSERT INTO Rating
VALUES
(5, 5, '2015-11-07 16:17:54', 'Chicken is marinated really well.', 4.5, 2.7,  3.7, 2.1);
INSERT INTO Rating
VALUES
(13, 5, '2015-03-03 10:26:28', 'The portugese culture is reflected in the setting.', 4.7, 3.1, 5.0, 2.4);
INSERT INTO Rating
VALUES
(14, 5, '2014-08-11 22:57:10', 'Great family restaurant.', 2.5, 2.9, 1.0, 2.0);
INSERT INTO Rating
VALUES
(15, 5, '2013-10-19 15:35:29', 'Nando''s is my first love.', 4.2, 2.3, 4.3, 3.9);

--******************************SOCA KITCHEN & PUB******************************** -- 

INSERT INTO Rating
VALUES
('11','6','2013-07-22 06:12:03','Food took a long time but was worth the wait',4,4.2,3.6,3.6);

INSERT INTO Rating
VALUES
('14','6','2014-01-19 18:46:16','The chicken was dry and the waiter never refilled my water',1.3,2.9,1.6,1.8);

INSERT INTO Rating
VALUES
('6','6','2014-11-20 05:54:43','The food is great, price is great, everyone go to SOCAs!',4.8,4.9,3.9,4);

INSERT INTO Rating
VALUES
('8','6','2015-01-02 07:40:54','Food was good but a bit too expensive',2.6,4.2,4.0,3.2);

INSERT INTO Rating
VALUES
('13','6','2015-02-01 15:42:09','Affordable place to take a date with decent food',4.3,3.4,3.3,3.9);

INSERT INTO Rating
VALUES
('12','6','2015-01-20 11:53:56','Great prices but the takes 20 minutes to receive your food.',2.4,4.2,3.9,5);

INSERT INTO Rating
VALUES
('1','6','2014-12-30 19:01:28','Bad experience and the food was cold',2.4,1,1,1);

INSERT INTO Rating
VALUES
('3','6','2013-06-03 19:18:19','The service was okay, but it could have been better',3.1,3.5,3.3,3);

-- ************************************HAVELI************************************* --

INSERT INTO Rating
VALUES
('2','7','2014-12-05 09:52:03','Too expensive for a small amount of food',2,2.2,3.6,3.6);

INSERT INTO Rating
VALUES
('4','7','2014-11-19 15:10:16','The waiters were rude but the food was nice',3.3,3.9,1.6,1.8);

INSERT INTO Rating
VALUES
('6','7','2014-05-25 08:04:43','Your treated with respect while you eat some cheap tasty food',4.8,4.9,3.9,4.2);

INSERT INTO Rating
VALUES
('8','7','2013-01-22 07:00:54','Expensive but nowadays all restaurants are. Food was acceptable',2.6,4.2,4.0,4.2);

INSERT INTO Rating
VALUES
('10','7','2015-03-13 22:42:09','Walked out of the restaurant angry from the service',2,2,1,1);

INSERT INTO Rating
VALUES
('12','7','2015-03-16 14:53:56','I saw my food made but the waiter took an extra 10 minutes to answer a phone call',2,2,1,1);

INSERT INTO Rating
VALUES
('14','7','2014-09-04 10:01:28','Thought i would give this place a chance but im definitely not coming back',1,1,1,1);

INSERT INTO Rating
VALUES
('1','7','2013-11-13 12:08:19','If you like Indian food this is the place to be',4.1,4.5,4.3,3);

-- **********************************MUCHO BURRITO******************************** --

INSERT INTO Rating
VALUES
('3','8','2013-01-25 16:22:03','Best burritos in town!',4,4.6,4.6,4.6);

INSERT INTO Rating
VALUES
('5','8','2014-04-02 22:01:16','Takes a long time for the staff to make over 5 burritos so it isnt the best place for large groups',3.3,3.9,3.6,3.8);

INSERT INTO Rating
VALUES
('7','8','2015-01-20 15:58:43','I made it a weekly routine to get my burritos from Mucho Burrito! Try it!',4.8,4.9,4.9,4);

INSERT INTO Rating
VALUES
('9','8','2013-01-24 04:40:54','Hate that they charge extra for specific toppings, other than that the food is good',2.6,4.2,4.0,4.2);

INSERT INTO Rating
VALUES
('11','8','2015-02-01 19:42:09','Never thought i would fall in love with Mexican food but i did!',4.3,4.4,4.3,4.9);

INSERT INTO Rating
VALUES
('13','8','2015-03-10 12:53:56','Nice quiet place to grab lunch with a few friends',4.4,4.2,3.9,5);

INSERT INTO Rating
VALUES
('15','8','2014-10-03 09:01:28','My burrito was too soggy, was not like the ones my mom makes at home. True mexican people would be disappointed',2.4,2,2,2);

INSERT INTO Rating
VALUES
('2','8','2014-06-13 05:18:29','6 bucks for a small buritto?? I can buy the ingrediants for ten burritos with that money',1.1,3.5,3.3,3);

-- *********************************SHAWARMA PRINCE****************************** -- 

INSERT INTO Rating
VALUES
('4','9','2013-06-15 01:12:53','Great place to take the family',4,4,4,4);

INSERT INTO Rating
VALUES
('6','9','2014-11-12 03:36:06','The white rice is always fresh! The shawarma plate is the best option',4.3,4.9,3.6,4.8);

INSERT INTO Rating
VALUES
('8','9','2014-02-20 03:44:43','The garlic potatoes are amazing but expensive',2.8,4.9,3.9,4);

INSERT INTO Rating
VALUES
('10','9','2014-03-05 18:10:54','The pickles were sour, seems like everytime i go late the food quality is poor',3.6,2.2,3.0,3.2);

INSERT INTO Rating
VALUES
('12','9','2015-04-01 11:42:09','Took way too long to get my food',3,3,1,1);

INSERT INTO Rating
VALUES
('14','9','2014-10-00 20:53:56','I personally prefer Shawarma Gloucester location, the other two are always packed.',3,4.2,3.9,3);

INSERT INTO Rating
VALUES
('1','9','2014-11-10 19:01:28','Multiple locations so give it a try!',4.4,4,4,4);

INSERT INTO Rating
VALUES
('3','9','2013-06-11 12:22:03','The shawarma plate is amazing',4.1,4.5,4.3,4);

-- *****************************EAST SIDE MARIO'S*********************************--

INSERT INTO Rating
VALUES
('5','10','2013-12-05 10:12:03','Alfredo sauce was too salty',2,2,3,3);

INSERT INTO Rating
VALUES
('7','10','2015-01-01 23:00:16','So much ragu sauce in my pasta',3.3,1.9,3.6,3.8);

INSERT INTO Rating
VALUES
('9','10','2014-11-20 10:54:43','The waiter took way too long to bring me my food',4.8,4.9,1.9,1);

INSERT INTO Rating
VALUES
('11','10','2015-03-02 14:00:54','The service was great but the food could have been better',2.6,2.2,4.0,4.2);

INSERT INTO Rating
VALUES
('13','10','2014-06-11 05:42:09','Best pasta ever!!',4.3,4.4,3.3,3.9);

INSERT INTO Rating
VALUES
('15','10','2014-04-20 01:53:56','You need to give East Side Marios a chance, you will love it',4,4,4,4);

INSERT INTO Rating
VALUES
('1','10','2013-02-03 12:01:58','Everything about this place is perfect, the food, the prices, the staff, everything!',5,5,5,5);

INSERT INTO Rating
VALUES
('3','10','2013-10-05 07:25:39','Disappointed in the service after all the good reviews i read about East Side Marios',3.1,3.5,2.3,2);

--############################################################################### -- Red Lobster -- #############################################################
INSERT INTO Rating
VALUES
('1','11','2012-12-25 09:12:59','Loved the food! Overall, great restaurant. ',3.4,4.2,3.0,2.6);

INSERT INTO Rating
VALUES
('15','11','2013-09-15 15:26:16','Horrible food and service!',1.3,1.9,1.9,2.6);

INSERT INTO Rating
VALUES
('13','11','2014-07-07 02:24:43','Avoid this restaurnt all costs!',1.3,2.1,1.9,1.0);

INSERT INTO Rating
VALUES
('12','11','2015-04-12 07:16:34','Overpriced, but the food was amazing!',0.4,4.2,3.0,3.6);

INSERT INTO Rating
VALUES
('9','11','2012-12-29 19:41:08','Great restaurant overall',3.6,4.4,3.2,4.6);

INSERT INTO Rating
VALUES
('6','11','2015-01-20 03:59:56','Nice and friendly staff and the food exceeded our expectations!',1.4,4.2,3.9,5);

INSERT INTO Rating
VALUES
('4','11','2012-06-25 06:13:17','Great family restaurnt!',3.4,4.2,3.0,3.1);

INSERT INTO Rating
VALUES
('9','11','2013-01-12 20:09:42','Food was served cold, gloomy setting',3.1,0.5,1.4,2.1);

--############################################################################### -- Pho Thu Do -- #############################################################
INSERT INTO Rating
VALUES
('1','12','2013-06-13 11:56:12','Best Pho is the city!',4.3,4.9,3.6,3.6);

INSERT INTO Rating
VALUES
('15','12','2015-07-13 19:19:45','Affordable Price for some great pho!', 4.3,3.9,4.0,3.6);

INSERT INTO Rating
VALUES
('13','12','2014-07-05 23:32:15','Great location with great service and food',4.4,4.1,5.0,3.7);

INSERT INTO Rating
VALUES
('12','12','2015-04-12 06:19:42','Great place to take a date ;) !',3.9,4.6,4.3,3.1);

INSERT INTO Rating
VALUES
('9','12','2012-12-13 12:03:08','Very dirty place and horrible customer service',1.1,1.2,1.7,0.8);

INSERT INTO Rating
VALUES
('6','12','2014-04-20 09:45:10','Overall, great restaurant....the shrimp chips and spring rolls were amazing!',3.7,4.2,3.4,3.8);

INSERT INTO Rating
VALUES
('4','12','2012-06-25 21:10:28','The restaurant has a great take out menu',3.1,3.4,3.7,2.2);

INSERT INTO Rating
VALUES
('9','12','2013-01-12 12:11:42','Nice and friendly staff at the restaurant!',2.4,2.6,2.9,4.7);


--############################################################################### -- Vittoria Trattoria -- #############################################################
INSERT INTO Rating
VALUES
('6','13','2014-05-19 19:27:11','Great downtown location in the Bywood market!',4.4,4.8,4.9,3.6);

INSERT INTO Rating
VALUES
('9','13','2013-09-15 09:12:05','The restaurant is a little overpriced , but overall a great restaurant!',2.9,3.1,3.2,4.6);

INSERT INTO Rating
VALUES
('7','13','2015-07-07 07:17:13','Highly recomend everyone to try the Garlic Steamed Mussels; overall great restaurant', 4.3,4.9,4.3,4.1);

INSERT INTO Rating
VALUES
('3','13','2015-04-12 21:19:17','You have''t lived if you havn''t tried the Alla Nonna pasta from Vittoria Trattoria!', 3.2,4.2,3.4,3.1);

INSERT INTO Rating
VALUES
('1','13','2012-12-29 03:41:08','Overall, Amazing food!',3.6,4.4,3.2,4.6);

INSERT INTO Rating
VALUES
('14','13','2015-01-20 01:59:56','A lot of variety to choose from',1.4,4.2,3.9,5);

INSERT INTO Rating
VALUES
('13','13','2014-07-07 00:09:17','Nice highend restaurnt, but a little overpriced!',1.4,4.2,3.0,2.6);

INSERT INTO Rating
VALUES
('15','13','2013-10-13 01:17:42','Authentic Italian cuisine with fine wine! Beware the restaurant is EXPENSIVE.',1.2,1.1,1.4,2.1);


--############################################################################### -- Lone Star Texas Grill -- #############################################################

INSERT INTO Rating
VALUES
('11','14','2013-03-19 10:11:03','Very generous food portions, but the waiter was rude',3.4,4.2,3.0,1.6);

INSERT INTO Rating
VALUES
('14','14','2014-10-13 15:26:16','Best ribs and steaks in town',1.3,2.9,2.9,2.6);

INSERT INTO Rating
VALUES
('6','14','2014-07-07 02:24:43','Many options to personalize the menu',2.8,2.9,3.9,1.9);

INSERT INTO Rating
VALUES
('8','14','2015-04-12 07:16:34','Well priced and good food',3.9,4.2,3.0,3.6);

INSERT INTO Rating
VALUES
('13','14','2014-12-01 12:12:19','Great for Friday night out with the boys',3.3,4.4,3.3,4.9);

INSERT INTO Rating
VALUES
('12','14','2015-04-20 11:53:56','Nice sports bar',2.4,4.2,3.9,5);

INSERT INTO Rating
VALUES
('1','14','2012-12-25 16:01:23','Average restaurant, nothing special. No vegetarian menu',2.4,2.2,3.2,2.6);

INSERT INTO Rating
VALUES
('3','14','2013-01-12 17:10:19','Food was served cold and horrible service.',1.1,1.5,1.3,1.1);


--############################################################################### -- Silk Road Kabob House -- #############################################################
												
INSERT INTO Rating
VALUES
('5','15','2014-05-01 19:12:11','COLD KABOBS - HATE THIS RESTAURANT!',2.4,1.2,1.0,1.0);

INSERT INTO Rating
VALUES
('14','15','2014-09-15 16:22:01','Friendly staff and great menu.',3.3,2.9,2.5,4.6);

INSERT INTO Rating
VALUES
('9','15','2014-07-07 02:29:41','Qucik service; but, the restaurnt has nothing special to offer.',2.9,2.5,2.5,3.2);

INSERT INTO Rating
VALUES
('6','15','2015-04-12 16:42:31','Food is priced well. You get what you paid for!',3.4,4.2,4.0,3.6);

INSERT INTO Rating
VALUES
('9','15','2012-12-29 17:24:19','Restaurant exceeded my expectations',3.4,4.2,3.1,4.7);

INSERT INTO Rating
VALUES
('2','15','2015-09-20 22:42:25','Great buffett, but no wow factor',2.5,2.5,2.9,4.2);

INSERT INTO Rating
VALUES
('2','15','2015-01-09 03:35:11','Family friendly restaurnt!',3.1,4.3,2.9,4.6);

INSERT INTO Rating
VALUES
('4','15','2013-01-12 14:45:45','Great food at the restaurant! One of my favourites...', 3.1,3.5,1.4,2.5);



--Sarmad's Menu Items 1-15--

/***Add Menu Items**/
INSERT INTO MenuItem
VALUES
(DEFAULT, 1, 'Fish & Chips', 'Food', 'Starter', 'Traditional pad thai with chicken.', 11.50);
INSERT INTO MenuItem
VALUES
(DEFAULT, 1, 'Lobster Roll', 'Food', 'Main', 'Traditional pad thai with chicken.', 11.50);
INSERT INTO MenuItem
VALUES
(DEFAULT, 1, 'Beer', 'Beverage', 'Starter', 'Great beer.', 1.50);
INSERT INTO MenuItem
VALUES
(DEFAULT, 2, 'Green Tea Ice Cream', 'Food', 'Dessert', 'Ice cream made with green tea flavour.', 2.50);
INSERT INTO MenuItem
VALUES
(DEFAULT, 2, 'Spicy Crispy Salmon', 'Food', 'Main', 'Traditional pad thai with chicken.', 4.39);
INSERT INTO MenuItem
VALUES
(DEFAULT, 2, 'Chicken Teriyaki Hand Roll', 'Food', 'Starter', 'Chicken teriyaki wrapped in seaweed. 6 pieces.', 3.39);
INSERT INTO MenuItem
VALUES
(DEFAULT, 3, 'Chicken Tikka Masala', 'Food', 'Main', 'Boneless pieces of chicken breast, first broiled in tandoor then cooked with fresh onions, green peppers and tomatoes.', 16.99);
INSERT INTO MenuItem
VALUES
(DEFAULT, 3, 'Ras Malai', 'Food', 'Dessert', 'Indian cheese in mild cream sauce.', 6.00);
INSERT INTO MenuItem
VALUES
(DEFAULT, 3, 'Mango Lassi', 'Beverage', 'Dessert', 'Blend of yogurt, water, spices and mango.', 2.99);
INSERT INTO MenuItem
VALUES
(DEFAULT, 4, 'Pad Thai Chicken', 'Food', 'Main', 'Traditional pad thai with chicken.', 11.50);
INSERT INTO MenuItem
VALUES
(DEFAULT, 4, 'Guay Teau Lad Na with shrimp', 'Food', 'Main', 'Choice of chicken, beef, pork or shrimp, pan fried with vegetables, eggs and special Thai gravy served over soft wide rice noodles.', 15.50);
INSERT INTO MenuItem
VALUES
(DEFAULT, 4, 'Pla Meuk Yang', 'Food', 'Main', 'Charbroiled marinated calamari. Served with spicy and sour sauce.', 8.00);
INSERT INTO MenuItem
VALUES
(DEFAULT, 5, 'Nestea ® Iced Tea', 'Beverage', 'Starter', 'Nestea ® Iced Tea.', 2.00);
INSERT INTO MenuItem
VALUES
(DEFAULT, 5, 'PERi PERi Chicken Caesar Wrap', 'Food', 'Main', 'Pick your spice and add our legendary PERi-PERi chicken to our classic Caesar Salad – served in a whole wheat wrap.', 7.25);
INSERT INTO MenuItem
VALUES
(DEFAULT, 5, 'Veggie Pita', 'Food', 'Main', 'Served in a warm pita with our signature pita mix.', 6.75);


-- Muraad's MenuItems 16-30 -- 

INSERT INTO MenuItem
VALUES
(DEFAULT,'6','CARLES ROQUEFORT','Starter','Food','French, soft, and unpasteurized cheese', 5);

INSERT INTO MenuItem
VALUES
(DEFAULT,'6','ROASTED MUSHROOM SALAD','Main','Food','Enjoy a tasty salad topped with roasted mushrooms, black garlic, and white truffle', 15);

INSERT INTO MenuItem
VALUES
(DEFAULT,'6','STRATUS, MOSAIC, NIAGARA ON THE LAKE','Dessert','Beverage','DESSERT IN A GLASS', 9.17);


INSERT INTO MenuItem
VALUES
(DEFAULT,'7','Aloo Tiki Chaat','Starter','Food','Two potato patties topped with curried chickpeas, yogurt, and a delicious tamarind sauce', 6.50);

INSERT INTO MenuItem
VALUES
(DEFAULT,'7','Shahjehani Biryani','Main','Food','An ornate rice dish cooked with boneless lamb, nuts, raisins, and flavored with saffron', 16.25);

INSERT INTO MenuItem
VALUES
(DEFAULT,'7','Patiala Pulao','Main','Food','An elegant Punjabi preparation, Basmati rice cooked with green peas, garnished with mushrooms.', 5.50);


INSERT INTO MenuItem
VALUES
(DEFAULT,'8','Nachos','Starter','Food','Fresh tortilla chips and layer of two melted cheeses, toppings and five types of salsa and sour cream', 8.95);

INSERT INTO MenuItem
VALUES
(DEFAULT,'8','Salad Bowl','Main','Food','Shell bowl with cold crisp Romaine lettuce, with piping hot fillings, all of your favourite toppings, fresh salsa and cheese.', 13.95);

INSERT INTO MenuItem
VALUES
(DEFAULT,'8','Hot Fudge Mexican Brownie','Dessert','Food','A spicy Mexican chocolate brownie (the heat is bearable!)', 7.45);


INSERT INTO MenuItem
VALUES
(DEFAULT,'9','Garlic Potatoes','Starter','Food','Crisp potatoes topped with garlic sauce',4.95 );

INSERT INTO MenuItem
VALUES
(DEFAULT,'9','Family Shawarma Plate','Main','Food','Two trays filled with chicken, beef,garlic potatoes,rice, and tons of veggies', 36.99);

INSERT INTO MenuItem
VALUES
(DEFAULT,'9','Chicken Shawarma Sandwich','Main','Food','Chicken, garlic, hummus sauce, and veggies wrapped in a crispy pita', 4.99);


INSERT INTO MenuItem
VALUES
(DEFAULT,'10','Spaghettini and Meatballs','Main','Food','First we simmer our famous meatballs in Napolitana sauce. Then we pile them on long and thin spaghettini noodles. How about some shredded Parm?', 13.99);

INSERT INTO MenuItem
VALUES
(DEFAULT,'10','Baked Penne Alfredo','Main','Food','Penne, broccoli, Alfredo sauce and mozzarella become best friends when they are baked together to perfection. Served with our fresh bruschetta',13.99 );

INSERT INTO MenuItem
VALUES
(DEFAULT,'10','Root Beer Float','Dessert','Beverage','Frothy treat made with vanilla ice cream and Barqs Root Beer', 3 );

-- Salman's MenuItems 31-45--


INSERT INTO MenuItem
VALUES
(DEFAULT,'11','Maritime Lobster','food','Main','Steamed, or roasted with broccoli, rice and cheese stuffing. Served with sweet corn on the cob and baby gold potatoes. ', 29.99);


INSERT INTO MenuItem
VALUES
(DEFAULT,'11','Island Jumbo Coconut Shrimp','food','main','Hand–dipped in coconut batter, then tossed in coconut and fried until golden brown.', 17.99);


INSERT INTO MenuItem
VALUES
(DEFAULT,'11','Stuffed Mushrooms','food','starter','Fresh mushrooms with a seafood, broccoli, rice and cheese stuffing, smothered in white Cheddar cheese and baked until bubbly brown', 9.99);

INSERT INTO MenuItem
VALUES
(DEFAULT,'12','Vietnamese Spring Rolls','starter','food','Fresh vegetables wrapped in rice paper', 6.45);

INSERT INTO MenuItem
VALUES
(DEFAULT,'12','Banana Treat','dessert','food','Deep Fried Banana with Honey', 4.95);

INSERT INTO MenuItem
VALUES
(DEFAULT,'12','Stir Rice','main','food','Stir Fried Shrimp with Basil Leaves and Cashew on Rice', 7.25);

INSERT INTO MenuItem
VALUES
(DEFAULT,'13','Montanara Pizza','main','food',' Tomato sauce, mozzarella, grilled eggplant, zucchini, red onion and bell peppers with fresh basil ', 16.00);

INSERT INTO MenuItem
VALUES
(DEFAULT,'13','Minestrone','starter','food','Italian vegetable soup', 7.00);

INSERT INTO MenuItem
VALUES
(DEFAULT,'13','Pescatore','main','food','Fettuccine with tiger shrimp, bay scallops, P.E.I. mussels and red bell peppers in a marinara sauce ', 21.00);

INSERT INTO MenuItem
VALUES
(DEFAULT,'14','BBQ Brisket Burger','main','food','Mesquite-grilled beef topped with our Texas-style smoked brisket, Original BBQ sauce, garlic mushrooms and crispy onions.', 15.49);

INSERT INTO MenuItem
VALUES
(DEFAULT,'14','Mexi-Beef Taco','main','starter','Soft flour tortillas brushed with Mole and topped with Mexi-beef, Tomatillo salsa, peppers & onions and Cheddar cheese. ', 14.99);

INSERT INTO MenuItem
VALUES
(DEFAULT,'14','Lone Star Flat Iron Steak','main','starter',' 6oz. boneless top-blade cut steak, Mesquite grilled', 18.49);

INSERT INTO MenuItem
VALUES
(DEFAULT,'15','Persian Soltani Kabob','food','main','One Skewer of Barg & One Skewer of Koobideh Kabob (Beef Shami).', 22.99);

INSERT INTO MenuItem
VALUES
(DEFAULT,'15','Sambosas','food','starter','Choice of Beef or Vegetables fried wraps', 7.99);

INSERT INTO MenuItem
VALUES
(DEFAULT,'15','Persian Tea','desert','drink','Creamy tea with almonds and honey', 3.50);



-- Sarmad's RatingItems -- 


INSERT INTO RatingItem
VALUES
(3, 1, '2014-11-23 16:19:52', 2.7, 'Hated it.');
INSERT INTO RatingItem
VALUES
(6, 2, '2014-03-20 22:27:32', 1.2, 'Not impressed at all.');
INSERT INTO RatingItem
VALUES
(2, 3, '2015-03-03 17:21:22', 3.7, 'Average.');
INSERT INTO RatingItem
VALUES
(12, 4, '2015-03-23 09:36:19', 4.7, 'Excellent.');
INSERT INTO RatingItem
VALUES
(4, 5, '2014-02-17 12:09:55', 4.2, 'Very impressed.');
INSERT INTO RatingItem
VALUES
(9, 6, '2013-08-10 13:22:59', 3.4, 'Required more flavour.');
INSERT INTO RatingItem
VALUES
(10, 7, '2014-10-20 19:45:29', 4.3, 'Almost perfect.');
INSERT INTO RatingItem
VALUES
(2, 8, '2014-09-09 19:57:10', 5.0, 'Masterpiece.');
INSERT INTO RatingItem
VALUES
(7, 9, '2015-03-07 19:22:09', 3.2, 'Not amazing. Not bad.');
INSERT INTO RatingItem
VALUES
(8, 10, '2012-12-09 23:22:08', 2.9, 'Alright.');
INSERT INTO RatingItem
VALUES
(14, 11, '2014-12-22 02:39:24', 2.5, 'Try harder next time.');
INSERT INTO RatingItem
VALUES
(14, 12, '2014-12-15 12:05:19', 3.8, 'Almost perfection.');
INSERT INTO RatingItem
VALUES
(13, 13, '2015-03-10 18:26:14', 1.6, 'Left a bad taste in my mouth.');
INSERT INTO RatingItem
VALUES
(3, 14, '2015-02-05 17:37:34', 2.1, 'Not true food.');
INSERT INTO RatingItem
VALUES
(1, 15, '2015-02-10 23:57:04', 2.9, 'Needed more spices.');

-- Muraad's RatingItems -- 



INSERT INTO RatingItem
VALUES
('2','16','2014-06-20 19:45:10',2,'The cheese is soft but you can taste the fat in every bite');

INSERT INTO RatingItem
VALUES
('4','17','2013-04-02 03:05:10',3.6,'Good salad if your on a diet');

INSERT INTO RatingItem
VALUES
('6','18','2014-07-11 05:00:10',2,'Way too sweet, needed to water it down');



INSERT INTO RatingItem
VALUES
('8','19','2014-11-26 18:05:10',3,'Pretty expensive for an appetizer');

INSERT INTO RatingItem
VALUES
('10','20','2015-01-12 01:22:10',3.6,'Nice mixture of raisins nuts and rice');

INSERT INTO RatingItem
VALUES
('12','21','2015-04-02 22:03:10',4.2,'Amazing dish');


INSERT INTO RatingItem
VALUES
('14','22','2014-08-20 15:36:10',2,'way too spicy, the hot peppers were everywhere');

INSERT INTO RatingItem
VALUES
('1','23','2014-12-25 02:22:10',5,'So much food for a resonable price');

INSERT INTO RatingItem
VALUES
('3','24','2014-09-20 14:45:10',5,'Soft and delicious brownie!');


INSERT INTO RatingItem
VALUES
('5','25','2014-11-16 05:33:10',3,'Best garlic potatoes but they are a bit expensive');

INSERT INTO RatingItem
VALUES
('7','26','2014-12-20 16:00:10',5,'Best chicken shawarma plate in town');

INSERT INTO RatingItem
VALUES
('9','27','2013-01-02 12:10:10',1,'My sandwich was falling apart the moment I grabbed it out of the Bag');


INSERT INTO RatingItem
VALUES
('11','28','2015-02-02 03:21:11',2.5,'Meatballs were dry');

INSERT INTO RatingItem
VALUES
('13','29','2014-10-26 09:45:10',4.3,'Nice balance of different flavors');

INSERT INTO RatingItem
VALUES
('15','30','2014-04-20 18:56:10',3.5,'The root beer taste is a bit too strong for the ice cream mix');


-- Salman's RatingItems --

INSERT INTO RatingItem
VALUES
('1','31','2012-12-25 09:42:04', 2.2 ,'Tasted burnt, apparently it is supposed to take burnt.');


INSERT INTO RatingItem
VALUES
('15','31','2013-09-15 16:12:09', 2.0 ,'Smells weird!');

INSERT INTO RatingItem
VALUES
('13','31','2014-07-07 02:25:14', 2.7 ,'It was dry and tasteless.');


INSERT INTO RatingItem
VALUES
('12','32','2015-04-12 07:25:14', 4.1 ,'AMAZING SHRIMP!!!!!');


INSERT INTO RatingItem
VALUES
('9','33','2013-01-12 20:12:57', 1.2 ,'AVOID! The mushrooms lacked flavor.');


INSERT INTO RatingItem
VALUES
('1','34','2013-06-13 12:01:27', 3.2,'Taste greate, but they were too oily');


INSERT INTO RatingItem
VALUES
('15','35','2015-07-13 20:26:11', 4.5 ,'A really good dessert. Highly reccomend it!');


INSERT INTO RatingItem
VALUES
('13','36','2014-07-05 23:38:19', 4.2 ,'Love the taste of basil in the rice');

INSERT INTO RatingItem
VALUES
('12','36','2015-04-12 06:21:52', 3.1 ,'I would not reccomend this, the sauce is way too salty');

INSERT INTO RatingItem
VALUES
('1','36','2013-06-13 12:03:37', 3.2 ,'Not a fan of the cashew nuts they mix in the rice');


INSERT INTO RatingItem
VALUES
('6','37','2014-05-19 19:35:10', 3.1,'Good pizza, but nothing special.');


INSERT INTO RatingItem
VALUES
('9','38','2013-09-15 09:15:15',4.9,'Highly recomend this soup!');

INSERT INTO RatingItem
VALUES
('7','38','2015-07-07 07:18:25',4.1,'Tastes great!');

INSERT INTO RatingItem
VALUES
('3','38','2015-04-12 21:20:10',4.2,'Really good vegetable soup.');


INSERT INTO RatingItem
VALUES
('1','39','2012-12-29 03:45:18',4.9,'Just WOW! Greate tasteing fettuccine.');


INSERT INTO RatingItem
VALUES
('11','40','2013-03-19 10:21:12', 3.9,'Nicely grilled and seasoned');


INSERT INTO RatingItem
VALUES
('8','41','2015-04-12 08:01:43', 2.1,'Not the best tasteing taco I have had');

INSERT INTO RatingItem
VALUES
('6','42','2014-07-07 02:26:34',4.9,'I would really recommned this if you are looking for some boneless steak.');

INSERT INTO RatingItem
VALUES
('8','42','2015-04-12 07:20:56',2.4,'Too spicy for my liking');

INSERT INTO RatingItem
VALUES
('14','42','2014-10-13 15:45:11',1.4,'I found it to be overcooked and too chewy');

INSERT INTO RatingItem
VALUES
('5','43','2014-05-01 19:20:19',0.9,'WORST Kabobs I have ever tasted! Avoid at all costs.');

INSERT INTO RatingItem
VALUES
('14','44','2014-09-15 16:22:01',4.6,'YUM YUM YUM!');

INSERT INTO RatingItem
VALUES
('9','44','2012-12-29 17:40:29',4.9,'Greate taste, highly reccomend this as a starter');

INSERT INTO RatingItem
VALUES
('4','44','2013-01-12 14:51:41',4.2,'Good appetizer');

INSERT INTO RatingItem
VALUES
('2','45','2015-01-09 03:40:01', 2.1,'Too sweet and a waste of money.');



