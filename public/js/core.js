var restaurantProject = angular.module('restaurantProject', ['ngRoute']);


restaurantProject.config(['$routeProvider', function($routeProvider) {
    $routeProvider
        .when('/restaurants', 
            {
                controller: 'RestaurantController',
                templateUrl: 'html/restaurants.html'
            })
        .otherwise({redirectTo: '/restaurants'});
}]);


restaurantProject.controller('RestaurantController', function($scope, $http) {
        $http.get('/restaurant').success(function(data) {            
                $scope.restaurantList = data;
        });

        $scope.getRatings = function(restaurant) {            
            $http.get('/rating/' + restaurant.restaurantid).success(function(data) {                
                $scope.restaurantRatings = data;
            });
        }


        $scope.f = function() {            
            $http.get('/f').success(function(data) {                
                $scope.f = data;
            });
        }


        $scope.g = function() {            
            $http.get('/g').success(function(data) {                
                $scope.g = data;
            });
        }

        $scope.h = function(restaurant) {            
            $http.get('/h').success(function(data) {                
                $scope.h = data;
            });
        }

        $scope.i = function(restaurant) {            
            $http.get('/i/'+ $scope.type).success(function(data) {                
                $scope.i = data;
            });
        }

        $scope.j = function(restaurant) {            
           $http.get('/j').success(function(data) {                
                $scope.j = data;
            });
        }



}

);