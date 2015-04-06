// DB access operations

var pg = require('pg');
var connection = "postgres://postgres:admin@localhost:5432/postgres";
// req holds all the data that was entered from the view (ex: req.query.firstName)
// 
module.exports = {
  getRestaurants: function(req, res) {            
        var client = new pg.Client(connection);
        client.connect();

        // build query
        var query = client.query("select * from restaurant");

        // add rows obtained from query to result
        query.on("row", function (row, result) { 
            result.addRow(row);  //adds row to the result object (result object will have all the rows obtained from query after this)
        });        
        // once query has obtained all rows, decide what to do with result variable
        query.on("end", function (result) {                      
            client.end(); // disconnect client
            res.writeHead(200, {'Content-Type': 'application/json'}); // prepare result for view (response header)
            res.write(JSON.stringify(result.rows, null, "    ") + "\n"); // write the response
            res.end();  // send content of response to the client and signal the server that the response has been sent
        });
  },
  f: function(req, res) {            
        var client = new pg.Client(connection);
        client.connect();

        // build query
        var query = client.query("SELECT RT.name AS USER_NAME, R.name AS Restaurant_Name, COUNT(*) AS Number_of_ratinings FROM Restaurant R, Rater RT, Rating RA  WHERE RA.UserID = RT.UserID AND RA.RestaurantID = R.RestaurantID GROUP BY RT.NAME, R.name ORDER BY RT.name");

        // add rows obtained from query to result
        query.on("row", function (row, result) { 
            result.addRow(row);  //adds row to the result object (result object will have all the rows obtained from query after this)
        });        
        // once query has obtained all rows, decide what to do with result variable
        query.on("end", function (result) {                      
            client.end(); // disconnect client
            res.writeHead(200, {'Content-Type': 'application/json'}); // prepare result for view (response header)
            res.write(JSON.stringify(result.rows, null, "    ") + "\n"); // write the response
            res.end();  // send content of response to the client and signal the server that the response has been sent
        });
  },
  g: function(req, res) {            
        var client = new pg.Client(connection);
        client.connect();

        // build query
        var query = client.query("SELECT R.RestaurantID , R.name, R.type, L.phone_number FROM Restaurant R, Location L WHERE L.RestaurantID = R.RestaurantID AND R.RestaurantID NOT IN (SELECT RE.RestaurantID FROM Restaurant RE, Rating RT WHERE RT.rating_time BETWEEN '2015-01-01' AND '2015-02-01' AND RE.RestaurantID = RT.RestaurantID)");

        // add rows obtained from query to result
        query.on("row", function (row, result) { 
            result.addRow(row);  //adds row to the result object (result object will have all the rows obtained from query after this)
        });        
        // once query has obtained all rows, decide what to do with result variable
        query.on("end", function (result) {                      
            client.end(); // disconnect client
            res.writeHead(200, {'Content-Type': 'application/json'}); // prepare result for view (response header)
            res.write(JSON.stringify(result.rows, null, "    ") + "\n"); // write the response
            res.end();  // send content of response to the client and signal the server that the response has been sent
        });
  },
  h: function(req, res) {            
        var client = new pg.Client(connection);
        client.connect();

        // build query
        var query = client.query("SELECT L.open_date , R.name FROM Restaurant R, Location L, Rating RT WHERE L.RestaurantID = R.RestaurantID AND R.RestaurantID = RT.RestaurantID AND RT.staff < ( SELECT GREATEST (MAX(RT1.staff), MAX(RT1.food), MAX(RT1.price), MAX(RT1.mood)) FROM Rating RT1, Rater RA WHERE RT1.UserID = RA.UserID AND RA.name = 'User A')");

        // add rows obtained from query to result
        query.on("row", function (row, result) { 
            result.addRow(row);  //adds row to the result object (result object will have all the rows obtained from query after this)
        });        
        // once query has obtained all rows, decide what to do with result variable
        query.on("end", function (result) {                      
            client.end(); // disconnect client
            res.writeHead(200, {'Content-Type': 'application/json'}); // prepare result for view (response header)
            res.write(JSON.stringify(result.rows, null, "    ") + "\n"); // write the response
            res.end();  // send content of response to the client and signal the server that the response has been sent
        });
  },
  i: function(req, res) {            
        var client = new pg.Client(connection);
        client.connect();

        // build query
        var query = client.query("SELECT RT.name AS restaurant_name, R.name AS user_name FROM Restaurant R, Rater RT, Rating RA WHERE RA.RestaurantID = R.RestaurantID AND RA.UserID = RT.UserID AND R.type = '" + req.params.type + "' AND RA.food = (SELECT MAX(RA1.food) FROM Restaurant R1, Rater RT1, Rating RA1 WHERE RA1.RestaurantID = R1.RestaurantID AND R1.type = '" + req.params.type +"')");

        // add rows obtained from query to result
        query.on("row", function (row, result) { 
            result.addRow(row);  //adds row to the result object (result object will have all the rows obtained from query after this)
        });        
        // once query has obtained all rows, decide what to do with result variable
        query.on("end", function (result) {                      
            client.end(); // disconnect client
            res.writeHead(200, {'Content-Type': 'application/json'}); // prepare result for view (response header)
            res.write(JSON.stringify(result.rows, null, "    ") + "\n"); // write the response
            res.end();  // send content of response to the client and signal the server that the response has been sent
        });
  },
  j: function(req, res) {            
        var client = new pg.Client(connection);
        client.connect();

        // build query
        var query = client.query("SELECT CASE WHEN ( SELECT COUNT(*) FROM Restaurant R, Rating RA WHERE R.type = 'Indian' AND RA.RestaurantID = R.RestaurantID) >  (SELECT COUNT(*) FROM Restaurant R, Rating RA WHERE R.type = 'Indian' AND RA.RestaurantID = R.RestaurantID)  THEN 'Type X restaurants are more popular than Type Y restaurants' ELSE 'Type X restaurants are NOT AS popular as Type Y restaurants' END AS popular");

        // add rows obtained from query to result
        query.on("row", function (row, result) { 
            result.addRow(row);  //adds row to the result object (result object will have all the rows obtained from query after this)
        });        
        // once query has obtained all rows, decide what to do with result variable
        query.on("end", function (result) {                      
            client.end(); // disconnect client
            res.writeHead(200, {'Content-Type': 'application/json'}); // prepare result for view (response header)
            res.write(JSON.stringify(result.rows, null, "    ") + "\n"); // write the response
            res.end();  // send content of response to the client and signal the server that the response has been sent
        });
  },
    getRatings : function(req, res){        
        var client = new pg.Client(connection);
        client.connect();        
        var query = client.query("select * from rating where restaurantid = " + req.params.restaurantid);    

        query.on("row", function (row, result) { 
            result.addRow(row);
        });                

        query.on("end", function (result) {            
            client.end();
            res.writeHead(200, {'Content-Type': 'application/json'});
            res.write(JSON.stringify(result.rows, null, "    ") + "\n");            
            res.end();
        });
    }






};