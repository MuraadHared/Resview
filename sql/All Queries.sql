--Queries--

--a--
SELECT *
FROM RESTAURANT R, LOCATION L
WHERE R.name = '' AND R.RestaurantID = L.RestaurantID;

--b--
SELECT M.name, M.price
FROM MenuItem M , RESTAURANT R
WHERE R.name = '' AND M.RestaurantID = R.RestaurantID
ORDER BY M.category;

--c--

SELECT R.name, L.manager_name, L.street_address, L.open_date
FROM LOCATION L, RESTAURANT R
WHERE L.RestaurantID = R.RestaurantID AND R.type = 'PARAMETER';

--D--
SELECT M.name, M.price, L.manager_name, L.hour_open, l.hour_close, R.url
FROM LOCATION L , RESTAURANT R, MenuItem M
WHERE R.name='PARAMETER' AND R.RestaurantID=M.RestaurantID AND  L.RestaurantID=R.RestaurantID AND
M.PRICE >= ALL 
(
SELECT M.PRICE
FROM MenuItem M
WHERE M.RestaurantID = R.RestaurantID );


--E --
SELECT R.type, M.category, round(AVG(M.price), 2) AS Average_Price
FROM RESTAURANT R, MenuItem M
WHERE M.RestaurantID = R.RestaurantID
GROUP BY M.category, R.type
ORDER BY R.type;


-- F: TESTED 100%
SELECT RT.name AS USER_NAME, R.name AS Restaurant_Name, COUNT(*) AS Number_of_ratinings 
FROM Restaurant R, Rater RT, Rating RA
WHERE RA.UserID = RT.UserID AND RA.RestaurantID = R.RestaurantID
GROUP BY RT.NAME, R.name
ORDER BY RT.name;


-- G: TESTED 100%
SELECT R.RestaurantID , R.name, R.type, L.phone_number
FROM Restaurant R, Location L
WHERE L.RestaurantID = R.RestaurantID AND R.RestaurantID NOT IN (
  SELECT RE.RestaurantID
  FROM Restaurant RE, Rating RT
  WHERE RT.rating_time BETWEEN '2015-01-01' AND '2015-02-01' AND RE.RestaurantID = RT.RestaurantID
  ); 



-- H: TESTED 100%
SELECT R.name, L.open_date
FROM Restaurant R, Location L, Rating RT
WHERE L.RestaurantID = R.RestaurantID AND R.RestaurantID = RT.RestaurantID AND RT.staff < (
  SELECT GREATEST (MAX(RT1.staff), MAX(RT1.food), MAX(RT1.price), MAX(RT1.mood))
  FROM Rating RT1, Rater RA 
  WHERE RT1.UserID = RA.UserID AND RA.name = 'SomeGuy')
  GROUP BY R.name, L.open_date
  ORDER BY L.open_date;



-- I: TESTED 100%
SELECT RT.name AS user_name, R.name AS restaurant_name, RA.food 
FROM Restaurant R, Rater RT, Rating RA
WHERE RA.RestaurantID = R.RestaurantID AND RA.UserID = RT.UserID AND R.type = 'type-X' AND RA.food = (  
          SELECT MAX(RA1.food)
        FROM Restaurant R1, Rater RT1, Rating RA1 
        WHERE RA1.RestaurantID = R1.RestaurantID AND R1.type = 'type-X'
); 



-- J: TESTED 100%
SELECT 
  CASE
    WHEN 
		( SELECT COUNT(*) FROM Restaurant R, Rating RA WHERE R.type = 'Type X' AND RA.RestaurantID = R.RestaurantID) =
		(SELECT COUNT(*)  FROM Restaurant R, Rating RA WHERE R.type = 'Type Y' AND RA.RestaurantID = R.RestaurantID) 
     		THEN 'Type X are JUST AS popular as Type Y restaurants'
    WHEN
		( SELECT COUNT(*) FROM Restaurant R, Rating RA WHERE R.type = 'Type X' AND RA.RestaurantID = R.RestaurantID) >
		(SELECT COUNT(*) FROM Restaurant R, Rating RA WHERE R.type = 'Type Y' AND RA.RestaurantID = R.RestaurantID)
			THEN 'Type X restaurants are MORE popular as Type Y restaurants'
    ELSE 'Type X restaurants are NOT AS popular as Type Y restaurants'
  END 
  AS popular;

  /**k**/
SELECT r.name, r.join_date, r.reputation, rst.name, rat.rating_time, rat.food, rat.mood
FROM Rater r, Restaurant rst, Rating rat
WHERE r.UserID = rat.UserID
AND rat.RestaurantID = rst.RestaurantID
AND rat.food >= ALL(
	SELECT rat2.food
	FROM Rater r2, Restaurant rst2, Rating rat2
	WHERE r2.UserID = rat2.UserID
	AND rat2.RestaurantID = rst2.RestaurantID
	AND rat2.UserID != rat.userID
	)
AND rat.mood >= ALL(
	SELECT rat2.mood
	FROM Rater r2, Restaurant rst2, Rating rat2
	WHERE r2.UserID = rat2.UserID
	AND rat2.RestaurantID = rst2.RestaurantID
	AND rat2.UserID != rat.userID
	)
GROUP BY r.UserID, rst.RestaurantID, rat.rating_time, rat.food, rat.mood;

/**l**/
SELECT r.name, r.reputation, rst.name, rat.rating_time, rat.food, rat.mood
FROM Rater r, Restaurant rst, Rating rat
WHERE r.UserID = rat.UserID
AND rat.RestaurantID = rst.RestaurantID
AND (rat.food >= ALL(
	SELECT rat2.food
	FROM Rater r2, Restaurant rst2, Rating rat2
	WHERE r2.UserID = rat2.UserID
	AND rat2.RestaurantID = rst2.RestaurantID
	AND rat2.UserID != rat.userID
	)
OR rat.mood >= ALL(
	SELECT rat2.mood
	FROM Rater r2, Restaurant rst2, Rating rat2
	WHERE r2.UserID = rat2.UserID
	AND rat2.RestaurantID = rst2.RestaurantID
	AND rat2.UserID != rat.userID
	))
GROUP BY r.UserID, rst.RestaurantID, rat.rating_time, rat.food, rat.mood;


/**m**/
SELECT r.name, r.reputation, ri.rating_comment, i.price
FROM Rater r, Restaurant rst, RatingItem ri, MenuItem i
WHERE r.UserID = ri.UserID
AND ri.ItemID = i.ItemID
AND i.RestaurantID = rst.RestaurantID
AND rst.RestaurantID = 3
AND r.UserID IN (
	SELECT r2.UserID
	FROM Rater r2, Restaurant rst2, RatingItem ri2, MenuItem i2
	WHERE r2.UserID = ri2.UserID
	AND ri2.ItemID = i2.ItemID
	AND i2.RestaurantID = rst2.RestaurantID
	AND rst2.RestaurantID = 3
	GROUP BY r2.UserID	
	HAVING COUNT(*) = (
		SELECT COUNT(*)
		FROM Rater r2, Restaurant rst2, RatingItem ri2, MenuItem i2
		WHERE r2.UserID = ri2.UserID
		AND ri2.ItemID = i2.ItemID
		AND i2.RestaurantID = rst2.RestaurantID
		AND rst2.RestaurantID = 3
		GROUP BY r2.UserID
		ORDER BY COUNT(*) DESC
		LIMIT 1
	)	
);

/**n**/
SELECT r.name, r.email
FROM Rater r
WHERE NOT EXISTS (
	SELECT *
	FROM Rating rat
	WHERE r.UserId = rat.UserID
	AND rat.food > ANY(
		SELECT rat2.food
		FROM Rater r2, Rating rat2
		WHERE r2.userID = rat2.UserID
		AND r2.name = 'John'
	)
	AND rat.mood > ANY(
		SELECT rat2.mood
		FROM Rater r2, Rating rat2
		WHERE r2.userID = rat2.UserID
		AND r2.name = 'John'
	)
	AND rat.price > ANY(
		SELECT rat2.price
		FROM Rater r2, Rating rat2
		WHERE r2.userID = rat2.UserID
		AND r2.name = 'John'
	)
	AND rat.staff > ANY(
		SELECT rat2.staff
		FROM Rater r2, Rating rat2
		WHERE r2.userID = rat2.UserID
		AND r2.name = 'John'
	)	
);

/**o**/
Select r.name as rater_name, r.type, r.email, rst.name, rat.price, rat.food, rat.mood, rat.staff
FROM Rater r, Rating rat, Restaurant rst
WHERE r.UserID = rat.UserID
AND rat.RestaurantID = rst.RestaurantID
AND 2 <= (
	Select COUNT(*)
	FROM Rating rat2, Restaurant rst2
	WHERE r.UserID = rat2.UserID
	AND rat2.RestaurantID = rst2.RestaurantID
	AND rst.RestaurantID = rst2.RestaurantID
	)
AND (1 <= (
	SELECT stddev_samp(rat2.price)
	FROM Rating rat2, Restaurant rst2
	WHERE r.UserID = rat2.UserID
	AND rat2.RestaurantID = rst2.RestaurantID
	AND rst.RestaurantID = rst2.RestaurantID
	) OR
	1 <= (
	SELECT stddev_samp(rat2.food)
	FROM Rating rat2, Restaurant rst2
	WHERE r.UserID = rat2.UserID
	AND rat2.RestaurantID = rst2.RestaurantID
	AND rst.RestaurantID = rst2.RestaurantID
	) OR
	1 <= (
	SELECT stddev_samp(rat2.mood)
	FROM Rating rat2, Restaurant rst2
	WHERE r.UserID = rat2.UserID
	AND rat2.RestaurantID = rst2.RestaurantID
	AND rst.RestaurantID = rst2.RestaurantID
	) OR
	1 <= (
	SELECT stddev_samp(rat2.staff)
	FROM Rating rat2, Restaurant rst2
	WHERE r.UserID = rat2.UserID
	AND rat2.RestaurantID = rst2.RestaurantID
	AND rst.RestaurantID = rst2.RestaurantID
	) 
);

--Deleting a Restaurant -- 

DELETE FROM Restaurant
WHERE name = '';

--Deleting a Rater -- 

DELETE FROM Rater
WHERE UserID = '';

--Deleting a MenuItem -- 

DELETE FROM MenuItem
WHERE name = '';