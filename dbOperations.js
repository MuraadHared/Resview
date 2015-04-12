// DB access operations

var pg = require('pg');
var connection = "postgres://postgres:admin@localhost:5432/postgres";
// req holds all the data that was entered from the view (ex: req.query.firstName)
// 
module.exports = {

insertRestaurant : function(req, res){        
        var client = new pg.Client(connection);
        client.connect();            
        client.query("INSERT INTO Restaurant VALUES (DEFAULT, '" + req.params.nameOfRestaurant + "', '" + req.params.typeOfRestaurant + "', '" + req.params.url +"')");    

    },

insertMenuItem : function(req, res){        
        var client = new pg.Client(connection);
        client.connect(); 
                                                                    
        client.query("INSERT INTO MenuItem VALUES (DEFAULT,'" + req.params.restaurantID + "','" + req.params.nameOfItem + "','" + req.params.itemType + "','" + req.params.category + "','"+ req.params.descriptionn + "',"+  req.params.price + ")");   
    },

    
    getRaters: function(req, res) {            
        var client = new pg.Client(connection);
        client.connect();

        // build query
        var query = client.query("select * from rater");

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
  login: function(req, res) {
        var client = new pg.Client(connection);
        client.connect();
        console.log(req.params);
        // build query
        var query = client.query("select * from rater WHERE name = '" + req.params.user + "'"); // modify with password

        // add rows obtained from query to result
        query.on("row", function (row, result) { 
            result.addRow(row);  //adds row to the result object (result object will have all the rows obtained from query after this)
        });        
        // once query has obtained all rows, decide what to do with result variable
        query.on("end", function (result) {                      
            client.end(); // disconnect client            
            res.writeHead(200, {'Content-Type': 'application/json'}); // prepare result for view (response header)
            res.write(JSON.stringify(result.rows.length, null, "    ") + "\n"); // write the response
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
        var query = client.query("SELECT L.open_date , R.name FROM Restaurant R, Location L, Rating RT WHERE L.RestaurantID = R.RestaurantID AND R.RestaurantID = RT.RestaurantID AND RT.staff < ( SELECT GREATEST (MAX(RT1.staff), MAX(RT1.food), MAX(RT1.price), MAX(RT1.mood)) FROM Rating RT1, Rater RA WHERE RT1.UserID = RA.UserID AND RA.name = '"+ req.params.raterDropdown+"')");

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
        var query = client.query("SELECT CASE WHEN ( SELECT COUNT(*) FROM Restaurant R, Rating RA WHERE R.type = '"+ req.params.morePopularX + "' AND RA.RestaurantID = R.RestaurantID) >  (SELECT COUNT(*) FROM Restaurant R, Rating RA WHERE R.type = '"+ req.params.morePopularY + "' AND RA.RestaurantID = R.RestaurantID)  THEN '"+ req.params.morePopularX + " restaurants are more popular than " + req.params.morePopularY + " restaurants' ELSE '"+ req.params.morePopularX + " restaurants are NOT AS popular as "+ req.params.morePopularY + " restaurants' END AS popular");

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
    },

    //Query A
    //incorrect query, need to add location data
    selectRestaurant : function(req, res){        
        var client = new pg.Client(connection);
        client.connect();                
        var query = client.query("SELECT * FROM RESTAURANT R where R.RestaurantID = " + req.params.id);    

        query.on("row", function (row, result) { 
            result.addRow(row);
        });              

        query.on("end", function (result) {                        
            client.end();
            res.writeHead(200, {'Content-Type': 'application/json'});
            res.write(JSON.stringify(result.rows, null, "    ") + "\n");            
            res.end();
        });
    },

    //Query B
    selectMenuItem : function(req, res){        
        var client = new pg.Client(connection);
        client.connect();        
        var query = client.query("SELECT M.name, M.price FROM MenuItem M , RESTAURANT R WHERE R.RestaurantID = "+ req.params.id +" AND M.RestaurantID = R.RestaurantID ORDER BY M.category" );    

        query.on("row", function (row, result) { 
            result.addRow(row);
        });      

        query.on("end", function (result) {            
            client.end();
            res.writeHead(200, {'Content-Type': 'application/json'});
            res.write(JSON.stringify(result.rows, null, "    ") + "\n");            
            res.end();
        });
    },

    //Query C
    categoryRestaurant : function(req, res){        
        var client = new pg.Client(connection);
        client.connect();        
        var query = client.query("SELECT R.name, L.manager_name, L.street_address, L.open_date  FROM LOCATION L, RESTAURANT R WHERE L.RestaurantID = R.RestaurantID AND R.type = '"+ req.params.type +"'");    

        query.on("row", function (row, result) { 
            result.addRow(row);
        });      

        query.on("end", function (result) {            
            client.end();
            res.writeHead(200, {'Content-Type': 'application/json'});
            res.write(JSON.stringify(result.rows, null, "    ") + "\n");            
            res.end();
        });
    },

    //Query D
    expensiveMenuItem : function(req, res){        
        var client = new pg.Client(connection);
        client.connect();                
        var query = client.query("SELECT M.name, L.manager_name, L.hour_open, l.hour_close, R.url FROM LOCATION L , RESTAURANT R, MenuItem M WHERE R.RestaurantID = "+ req.params.id +" AND R.RestaurantID=M.RestaurantID AND  L.RestaurantID=R.RestaurantID AND M.price >= ALL ( SELECT M.price FROM MenuItem M )");    

        query.on("row", function (row, result) { 
            result.addRow(row);
        });      

        query.on("end", function (result) {
            console.log(result);
            client.end();
            res.writeHead(200, {'Content-Type': 'application/json'});
            res.write(JSON.stringify(result.rows, null, "    ") + "\n");            
            res.end();
        });
    },

    //Query E
    averagePrices : function(req, res){        
        var client = new pg.Client(connection);
        client.connect();        
        var query = client.query("SELECT R.type, M.category, AVG(M.price) AS Average_Price FROM RESTAURANT R, MenuItem M WHERE M.RestaurantID = R.RestaurantID GROUP BY M.category, R.type ORDER BY R.type");    

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