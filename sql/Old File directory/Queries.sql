--Queries--

--a--
SELECT *
FROM RESTAURANT R, LOCATION L
WHERE R.name = "" AND R.RestaurantID = L.RestaurantID;

--b--
SELECT M.name, M.price
FROM MenuItem M , RESTAURANT R
WHERE R.name = "" AND M.RestaurantID = R.RestaurantID;
ORDER BY M.category;

--c--

SELECT L.manager_name, L.open_date
FROM LOCATION L, RESTAURANT R
WHERE L.RestaurantID = R.RestaurantID AND R.type = "PARAMETER";

--D--
SELECT M.name, L.manager_name, L.hour_open, l.hour_close, R.url
FROM LOCATION L , RESTAURANT R, MenuItem M
WHERE R.name="PARAMETER" AND R.RestaurantID=M.RestaurantID AND  L.RestaurantID=R.RestaurantID AND
M.PRICE >= ALL 
(
SELECT M.PRICE
FROM MenuItem M; );


--E ***NEEDS TESTING*--
SELECT R.type, M.category, AVG(M.price) AS Average_Price
FROM RESTAURANT R, MenuItem M
WHERE M.RestaurantID = R.RestaurantID
GROUP BY M.category, R.type;


