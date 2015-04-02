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
SELECT L.open_date , R.name
FROM Restaurant R, Location L, Rating RT
WHERE L.RestaurantID = R.RestaurantID AND R.RestaurantID = RT.RestaurantID AND RT.staff < (
  SELECT GREATEST (MAX(RT1.staff), MAX(RT1.food), MAX(RT1.price), MAX(RT1.mood))
  FROM Rating RT1, Rater RA 
  WHERE RT1.UserID = RA.UserID AND RA.name = 'User A');



-- I: TESTED 100%
SELECT R.name, RT.name
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
    ( SELECT COUNT(*) FROM Restaurant R, Rating RA WHERE R.type = 'Indian' AND RA.RestaurantID = R.RestaurantID)
 > 
     (SELECT COUNT(*) FROM Restaurant R, Rating RA WHERE R.type = 'Indian' AND RA.RestaurantID = R.RestaurantID) 

     THEN 'Type X restaurants are more popular than Type Y restaurants'
    ELSE 'Type X restaurants are NOT AS popular as Type Y restaurants'
  END 
  AS popular;