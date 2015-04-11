var restaurantProject = angular.module('restaurantProject', ['ngRoute', 'Authentication', 'ngCookies']);
restaurantProject.config(['$routeProvider', function($routeProvider) {
    $routeProvider  
        .when('/login', 
            {
                controller: 'LoginController',
                templateUrl: 'html/login.html'
            })
        .when('/home', 
            {
                controller: 'RestaurantController',
                templateUrl: 'html/home.html'
            })
        .when('/menus', 
            {
                controller: 'RestaurantController',
                templateUrl: 'html/RestaurantsAndMenus.html'
            })
        .when('/restaurants', 
            {
                controller: 'RestaurantController',
                templateUrl: 'html/RatingsofRestaurants.html'
            })
        .when('/raters', 
            {
                controller: 'RestaurantController',
                templateUrl: 'html/RatersAndTheirRatings.html'
            })                   
        .otherwise({redirectTo: '/login'});
}]);

restaurantProject.controller('RestaurantController', ['$scope', '$rootScope', '$http','$location', function($scope, $rootScope, $http, $location) {        
        // get default data. Restaurants, Raters, RestaurantTypes
        $http.get('/restaurant').success(function(data) {            
                $scope.restaurantList = data;                
                var alreadyAdded = {};
                var types = [];
                data.forEach(function(r) {                    
                    if (!alreadyAdded[r.type]) {
                        alreadyAdded[r.type] = true;
                        types.push(r.type);
                    }
                })
                types.sort();
                $scope.types = types;   
                $scope.restaurant = $scope.restaurantList[0];
                $scope.restaurantType = $scope.types[0];
                $scope.restaurantTypeX = $scope.types[0];
                $scope.restaurantTypeY = $scope.types[0];
        });

         $http.get('/raters').success(function(data) {            
                $scope.raterList = data;                                
                $scope.raterName = $scope.raterList[0];                
        });


        $scope.getRatings = function(restaurant) {            
            $http.get('/rating/' + restaurant.restaurantid).success(function(data) {                
                $scope.restaurantRatings = data;
            });
        }

        $scope.redirectToQuery = function(q) {            
            eval("$scope."+ q +"()");            
        }
                                
        $scope.A = function() {                        
           $http.get('/A/' + $scope.restaurant.restaurantid).success(function(data) {                
                $scope.selectR = data;                
            });
        }

        $scope.B = function() {            
           $http.get('/B/' + $scope.restaurant.restaurantid).success(function(data) {                
                $scope.bData = data;
            });
        }

        $scope.C = function() {            
           $http.get('/C/' + $scope.restaurantType).success(function(data) {                
                $scope.cData = data;
            });
        }

        $scope.D = function() {            
           $http.get('/D/' + $scope.restaurant.restaurantid).success(function(data) {                
                $scope.dData = data;
            });
        }

        $scope.E = function() {            
           $http.get('/E').success(function(data) {                
                $scope.eData = data;
            });
        }


       $scope.F = function() {            
            $http.get('/F').success(function(data) {                
                $scope.frestaurantQuery = data;
            });
        }


        $scope.G = function() {            
            $http.get('/G').success(function(data) {                
                $scope.grestaurantQuery = data;
            });
        }

        $scope.H = function() {            
            $http.get('/H/' + $scope.raterName).success(function(data) {                                
                $scope.hrestaurantQuery = data;
            });
        }

        $scope.I = function() {            
            $http.get('/I/'+ $scope.restaurantType).success(function(data) {                
                $scope.irestaurantQuery = data;
            });
        }

        $scope.J = function() {            
           $http.get('/J/' + $scope.restaurantTypeX + '/' + $scope.restaurantTypeY).success(function(data) {                
                $scope.jrestaurantQuery = data;
            });
        }
}]);

restaurantProject.run(['$rootScope', '$location', '$cookieStore', '$http',
    function ($rootScope, $location, $cookieStore, $http) {
        // keep user logged in after page refresh
        $rootScope.globals = $cookieStore.get('globals') || {};
        if ($rootScope.globals.currentUser) {
            $http.defaults.headers.common['Authorization'] = 'Basic ' + $rootScope.globals.currentUser.authdata; // jshint ignore:line
        }
  
        $rootScope.$on('$locationChangeStart', function (event, next, current) {
            // redirect to login page if not logged in
            if ($location.path() !== '/login' && !$rootScope.globals.currentUser) {
                $location.path('/login');
        }
    });
}]);