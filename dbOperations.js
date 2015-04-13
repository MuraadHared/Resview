// DB access operations

var pg = require('pg');
var connection = "postgres://postgres:admin@localhost:5432/postgres";
// req holds all the data that was entered from the view (ex: req.query.firstName)
// 
module.exports = {
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
        // build query
        var query = client.query("select * from rater WHERE name = '" + req.params.user + "' AND password ='" + req.params.pass +"';"); // modify with password
        
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
        var query = client.query("SELECT L.open_date , R.name FROM Restaurant R, Location L, Rating RT WHERE L.RestaurantID = R.RestaurantID AND R.RestaurantID = RT.RestaurantID AND RT.staff < ( SELECT GREATEST (MAX(RT1.staff), MAX(RT1.food), MAX(RT1.price), MAX(RT1.mood)) FROM Rating RT1, Rater RA WHERE RT1.UserID = RA.UserID AND RA.UserID = '"+ req.params.id+"')");

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
        var query = client.query("SELECT * FROM RATING rat, Rater u WHERE rat.RestaurantID = " + req.params.restaurantid + " AND rat.UserID = u.UserID");    

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
        var query = client.query("SELECT * FROM RESTAURANT R , LOCATION L where R.RestaurantID = " + req.params.id + " AND L.RestaurantID = R.RestaurantID");    


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

        var query = client.query("SELECT M.name, M.price, L.manager_name, L.hour_open, l.hour_close, R.url FROM LOCATION L , RESTAURANT R, MenuItem M WHERE R.RestaurantID = "+ req.params.id +" AND R.RestaurantID=M.RestaurantID AND  L.RestaurantID=R.RestaurantID AND M.price >= ALL ( SELECT M.price FROM MenuItem M where R.RestaurantID = M.RestaurantID)");    
   
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

    //Query E
    averagePrices : function(req, res){        
        var client = new pg.Client(connection);
        client.connect();        

        var query = client.query("SELECT R.type, M.category, round(AVG(M.price),2) AS Average_Price FROM RESTAURANT R, MenuItem M WHERE M.RestaurantID = R.RestaurantID GROUP BY M.category, R.type ORDER BY R.type");    


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

     //Query K
    queryK : function(req, res){        
        var client = new pg.Client(connection);
        client.connect();        
        var query = client.query("SELECT r.name, r.join_date, r.reputation, rst.name as restaurant_name, rat.rating_time, rat.food, rat.mood FROM Rater r, Restaurant rst, Rating rat WHERE r.UserID = rat.UserID AND rat.RestaurantID = rst.RestaurantID AND rat.food >= ALL( SELECT rat2.food FROM Rater r2, Restaurant rst2, Rating rat2 WHERE r2.UserID = rat2.UserID AND rat2.RestaurantID = rst2.RestaurantID AND rat2.UserID != rat.userID ) AND rat.mood >= ALL( SELECT rat2.mood FROM Rater r2, Restaurant rst2, Rating rat2 WHERE r2.UserID = rat2.UserID AND rat2.RestaurantID = rst2.RestaurantID AND rat2.UserID != rat.userID ) GROUP BY r.UserID, rst.RestaurantID, rat.rating_time, rat.food, rat.mood;");    

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

    //Query L
    queryL : function(req, res){        
        var client = new pg.Client(connection);
        client.connect();        
        var query = client.query("SELECT r.name, r.reputation, rst.name as restaurant_name, rat.rating_time, rat.food, rat.mood FROM Rater r, Restaurant rst, Rating rat WHERE r.UserID = rat.UserID AND rat.RestaurantID = rst.RestaurantID AND (rat.food >= ALL(SELECT rat2.food FROM Rater r2, Restaurant rst2, Rating rat2 WHERE r2.UserID = rat2.UserID AND rat2.RestaurantID = rst2.RestaurantID AND rat2.UserID != rat.userID ) OR rat.mood >= ALL(SELECT rat2.mood FROM Rater r2, Restaurant rst2, Rating rat2 WHERE r2.UserID = rat2.UserID AND rat2.RestaurantID = rst2.RestaurantID AND rat2.UserID != rat.userID )) GROUP BY r.UserID, rst.RestaurantID, rat.rating_time, rat.food, rat.mood;");    

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

    //Query M
    queryM : function(req, res){        
        var client = new pg.Client(connection);
        client.connect();        
        
        var query = client.query("SELECT r.name, r.reputation, ri.rating_comment as comments, i.name as item_name, i.price FROM Rater r, Restaurant rst, RatingItem ri, MenuItem i WHERE r.UserID = ri.UserID AND ri.ItemID = i.ItemID AND i.RestaurantID = rst.RestaurantID AND rst.RestaurantID = " + req.params.id + " AND r.UserID IN ( SELECT r2.UserID FROM Rater r2, Restaurant rst2, RatingItem ri2, MenuItem i2 WHERE r2.UserID = ri2.UserID AND ri2.ItemID = i2.ItemID AND i2.RestaurantID = rst2.RestaurantID AND rst2.RestaurantID = " + req.params.id + " GROUP BY r2.UserID HAVING COUNT(*) = (SELECT COUNT(*) FROM Rater r2, Restaurant rst2, RatingItem ri2, MenuItem i2 WHERE r2.UserID = ri2.UserID AND ri2.ItemID = i2.ItemID AND i2.RestaurantID = rst2.RestaurantID AND rst2.RestaurantID = " + req.params.id +" GROUP BY r2.UserID ORDER BY COUNT(*) DESC LIMIT 1 ) );");    

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

    //Query N
    queryN: function(req, res){        
        var client = new pg.Client(connection);
        client.connect();        
        var query = client.query("SELECT r.name, r.email FROM Rater r WHERE NOT EXISTS ( SELECT * FROM Rating rat WHERE r.UserId = rat.UserID AND rat.food > ANY( SELECT rat2.food FROM Rater r2, Rating rat2 WHERE r2.userID = rat2.UserID AND r2.name = 'John') AND rat.mood > ANY(SELECT rat2.mood FROM Rater r2, Rating rat2 WHERE r2.userID = rat2.UserID AND r2.name = 'John' ) AND rat.price > ANY( SELECT rat2.price FROM Rater r2, Rating rat2 WHERE r2.userID = rat2.UserID AND r2.name = 'John' ) AND rat.staff > ANY( SELECT rat2.staff FROM Rater r2, Rating rat2 WHERE r2.userID = rat2.UserID AND r2.name = 'John' ));");    

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

    //Query O
    queryO : function(req, res){        
        var client = new pg.Client(connection);
        client.connect();        

        var query = client.query("Select r.name, r.type, r.email, rst.name, rat.price, rat.food, rat.mood, rat.staff FROM Rater r, Rating rat, Restaurant rst WHERE r.UserID = rat.UserID AND rat.RestaurantID = rst.RestaurantID AND 2 <= ( Select COUNT(*) FROM Rating rat2, Restaurant rst2 WHERE r.UserID = rat2.UserID AND rat2.RestaurantID = rst2.RestaurantID AND rst.RestaurantID = rst2.RestaurantID ) AND (1 <= ( SELECT stddev_samp(rat2.price) FROM Rating rat2, Restaurant rst2 WHERE r.UserID = rat2.UserID AND rat2.RestaurantID = rst2.RestaurantID AND rst.RestaurantID = rst2.RestaurantID ) OR 1 <= (SELECT stddev_samp(rat2.food) FROM Rating rat2, Restaurant rst2 WHERE r.UserID = rat2.UserID AND rat2.RestaurantID = rst2.RestaurantID AND rst.RestaurantID = rst2.RestaurantID ) OR 1 <= ( SELECT stddev_samp(rat2.mood) FROM Rating rat2, Restaurant rst2 WHERE r.UserID = rat2.UserID AND rat2.RestaurantID = rst2.RestaurantID AND rst.RestaurantID = rst2.RestaurantID ) OR 1 <= ( SELECT stddev_samp(rat2.staff) FROM Rating rat2, Restaurant rst2 WHERE r.UserID = rat2.UserID AND rat2.RestaurantID = rst2.RestaurantID AND rst.RestaurantID = rst2.RestaurantID ) );");    
        
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
    deleteRestaurant: function(req, res) {
        var client = new pg.Client(connection);
        client.connect();        
        // build query
        var query = client.query("DELETE FROM Restaurant WHERE RestaurantID = '" + req.params.RestaurantID +"';"); 

        
  },

 deleteRater: function(req, res) {
        var client = new pg.Client(connection);
        client.connect();        
        // build query
        var query = client.query("DELETE FROM Rater WHERE UserID = '" + req.params.UserID + "';"); 

  },

  deleteMenuItem: function(req, res) {
        var client = new pg.Client(connection);
        client.connect();                
        
        // build query
        var query = client.query("DELETE FROM MenuItem WHERE ItemID = " + req.params.ItemID + ";"); 

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

  getRaters: function(req, res) {            
        var client = new pg.Client(connection);
        client.connect();

        // build query
        var query = client.query("select * from Rater;");

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

  getMenuItems: function(req, res) {            
        var client = new pg.Client(connection);
        client.connect();

        // build query
        var query = client.query("select m.name, m.ItemID, m.type, m.description, m.category, m.price, r.RestaurantID from MenuItem m, Restaurant r where m.RestaurantID = r.RestaurantID AND r.RestaurantID = '"+ req.params.RestaurantID+ "';");

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
   insertRater: function(req, res) {
        var client = new pg.Client(connection);
        client.connect();        
        // build query

        var date;
        date = new Date();
        date = date.getUTCFullYear() + '-' + ('00' + (date.getUTCMonth() + 1)).slice(-2) + '-' + ('00' + date.getUTCDate()).slice(-2);

        var query = client.query("INSERT INTO Rater VALUES (DEFAULT, '" + req.params.email + "' , '" + req.params.password + "' , '" + req.params.name + "' , '" + date + "', '" + req.params.type + "', DEFAULT); ");         
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
  insertRestaurant : function(req, res){        
        var client = new pg.Client(connection);
        client.connect();            
        var query = client.query("INSERT INTO Restaurant VALUES (DEFAULT, '" + req.params.nameOfRestaurant + "', '" + req.params.typeOfRestaurant + "', '" + req.params.url +"')");    
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

insertMenuItem : function(req, res){        
        var client = new pg.Client(connection);
        client.connect();                                                                 
        var query = client.query("INSERT INTO MenuItem VALUES (DEFAULT,'" + req.params.restaurantID + "','" + req.params.nameOfItem + "','" + req.params.itemType + "','" + req.params.category + "','"+ req.params.descriptionn + "',"+  req.params.price + ")");   
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
    }
};