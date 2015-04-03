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
});