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
Select r.name, r.type, r.email, rst.name, rat.price, rat.food, rat.mood, rat.staff
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