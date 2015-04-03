// DB access operations

var pg = require('pg');
var connection = "postgres://postgres:2132@localhost:5432/RestaurantProject";
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