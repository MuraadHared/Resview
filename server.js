var express = require('express'),
    http = require('http'),    
    app = express();    

var dbOperations = require("./dbOperations.js");

var pg = require('pg');
var connection = "postgres://postgres:2132@localhost:5432/RestaurantProject";

app.set('views', __dirname + '/views') ;

// when someone accesses the / page, serve them with index.html which then handles everything else (single page application)
app.get('/' , function(req,res) {
    res.sendfile('public/html/index.html');    
});


// these are accessed by angularjs to create, read, update and delete (CRUD) data
app.get('/restaurant', function(req,res){	
    dbOperations.getRestaurants(req,res);    
});

app.get('/f', function(req,res){	
    dbOperations.f(req,res);    
});

app.get('/g', function(req,res){	
    dbOperations.g(req,res);    
});
app.get('/h', function(req,res){	
    dbOperations.h(req,res);    
});
app.get('/i/:type', function(req,res){	
    dbOperations.i(req,res);    
});
app.get('/j', function(req,res){	
    dbOperations.j(req,res);    
});


app.get('/rating/:restaurantid', function(req,res){	
    dbOperations.getRatings(req,res);    
});

app.set('port', process.env.PORT || 3001);
app.use(express.static(__dirname + '/public'));  
app.listen(app.get('port'), function () {   
    console.log('Express server listening on port ' + app.get('port'));    
});