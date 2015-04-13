var restaurantProject = angular.module('restaurantProject', ['ngRoute', 'Authentication', 'ngCookies', 'datatables']);
restaurantProject.config(['$routeProvider', '$compileProvider', function($routeProvider, $compileProvider) {
    $compileProvider.debugInfoEnabled(false);
    $routeProvider  
        .when('/login', 
            {
                controller: 'LoginController',
                templateUrl: 'html/login.html'
            })        
         .when('/signup', 
            {
                controller: 'RestaurantController',
                templateUrl: 'html/signup.html'
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
        .when('/viewRestaurant', 
            {
                controller: 'RestaurantController',
                templateUrl: 'html/viewRestaurant.html'
            })
        .when('/raters', 
            {
                controller: 'RestaurantController',
                templateUrl: 'html/RatersAndTheirRatings.html'
            })                   
        .otherwise({redirectTo: '/login'});
}]);

restaurantProject.directive('stars',['$compile', '$timeout', function($compile, $timeout) {
    return { 
        restrict: 'A',
        replace: true,       
        link: function(scope, element, attrs, model) {                                                
            var e = $compile(element.contents())(scope);
            $timeout(function(){                                
                var val = parseFloat(e.text());                    
                var size = Math.max(0, (Math.min(5, val))) * 16;                           
                var $span = $('<span />').width(size);                
                e.html($span);                      
                e.addClass("stars");                  
            },0);           
        }
    }
}]);

restaurantProject.controller('RestaurantController', ['$scope', '$rootScope', '$http','$location', '$route', function($scope, $rootScope, $http, $location, $route) {        
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

        $http.get('/getRaters').success(function(data) {            
                $scope.raterList = data;                                
                $scope.raterName = $scope.raterList[0];                
        });

        $scope.updateViewingRestaurant = function(restaurant) {             
            $rootScope.viewRestaurantInfo = restaurant;               
            $http.get('/rating/' + restaurant.restaurantid).success(function(data) {                
                $rootScope.viewRestaurantRatings = data;                                
            });            
            $http.get('/getMenuItems/' + restaurant.restaurantid).success(function(data) {                                
                $rootScope.viewRestaurantItems = data;                 
                $location.path('/viewRestaurant');                    
            });            
            
        }

        $scope.deleteRestaurant = function(restaurant) {            
            $http.get('/deleteRestaurant/' + restaurant.restaurantid).success(function(data) {
                $http.get('/restaurant').success(function(data) {            
                    $scope.restaurantList = data;                                                                                          
                    $route.reload();
                });                            
            });                     
            $route.reload();   
        }

        $scope.deleteRater = function(rater) {            
           $http.get('/deleteRater/' + rater.userid).success(function(data) {                
                $http.get('/getRaters').success(function(data) {            
                    $scope.raterList = data;                                
                    $route.reload();         
                });
            });
           $route.reload();
        }

        $scope.deleteMenuItem = function(item) {                                    
            $http.get('/deleteMenuItem/' + item.itemid).success(function(data) {
                $http.get('/getMenuItems/' + $scope.viewRestaurantInfo.restaurantid).success(function(data) {                                
                    $rootScope.viewRestaurantItems = data; 
                    $route.reload();
                });                           
            });                     
            $route.reload();   
        }

         $scope.addMenuItem = function(item) {            
            $http.get('/deleteMenuItem/' + item.itemid).success(function(data) {
                $http.get('/getMenuItems/' + item.restaurantid).success(function(data) {            
                    $rootScope.viewRestaurantItems = data; 
                    $route.reload();
                });                           
            });                     
            $route.reload();   
        }

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
            $http.get('/H/' + $scope.raterName.userid).success(function(data) {                                
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

        $scope.K = function() {            
           $http.get('/K').success(function(data) {                
                $scope.kData = data;
            });
        }

        $scope.L = function() {            
           $http.get('/L').success(function(data) {                
                $scope.lData = data;
            });
        }

        $scope.M = function(id) {            
           $http.get('/M/' + $scope.restaurant.restaurantid).success(function(data) {                
                $scope.mData = data;
            });
        }

        $scope.N = function(raterName) {            
           $http.get('/N/' + raterName).success(function(data) {                
                $scope.nData = data;
            });
        }

        $scope.O = function() {            
           $http.get('/O').success(function(data) {                
                $scope.oData = data;
            });
        }

          $scope.insertRater = function(rater) {            
             $http.get('/insertRater/' + rater.email + '/' + rater.password + '/' + rater.name + '/' + rater.type ).success(function(data) {
                 $location.path('/login');
             });
          }


       $scope.insertRestaurant = function(restInfo) {            
            $http.get('/insertRestaurant/' + restInfo.nameOfRestaurant + '/' + restInfo.typeOfRestaurant + '/' + restInfo.url).success(function(data) {                
                $http.get('/restaurant').success(function(data) {            
                    $scope.restaurantList = data;         
                    $route.reload();
                })
            });            
            $scope.xyz = restInfo.nameOfRestaurant;
            $scope.xyz1 = " has been added to the database!";
           
            restInfo.nameOfRestaurant = " ";
            restInfo.typeOfRestaurant = " ";
            restInfo.url = " ";    
            $route.reload();
        }

       $scope.insertMenuItem = function(item) {            
            $http.get('/insertMenuItem/' +  $scope.viewRestaurantInfo.restaurantid + '/' + item.nameOfItem + '/' + item.itemType + '/' + item.category + '/' + item.descriptionn + '/' + item.price).success(function(data) {  
                $http.get('/getMenuItems/' + $scope.viewRestaurantInfo.restaurantid).success(function(data) {                                
                    $rootScope.viewRestaurantItems = data; 
                    $route.reload();
                });        
            });

            $scope.xyz3 =   item.nameOfItem;
            $scope.xyz4 = " has been added to the database!";
           
            item.nameOfItem = " ";
            item.itemType = " ";
            item.category = " ";
            item.descriptionn = " "; 
            item.price = null;
            $route.reload();
        }

        $scope.getLocations = function(restaurant) {            
           $http.get('/getLocations' + restaurant.restaurantid).success(function(data) {                
                $scope.locationData = data;
            });
        }

        $scope.getRatingItems = function(item) {            
           $http.get('/getRatingItems' + item.itemid).success(function(data) {                
                $scope.ratingItemData = data;
            });
        }

        $scope.insertRating = function(rater) {            
             $http.get('/insertRating/' + rater.userid + '/' + rater.restaurantid + '/' + rater.comments + '/' + rater.price + '/' + rater.food + '/' + rater.mood + '/' + rater.staff ).success(function(data) {
               $route.reload();  

             });
          }

          $scope.insertRatingItem = function(rater) {            
             $http.get('/insertRatingItem/' + rater.userid + '/' + rater.itemid + '/' + rater.rating + '/' + rater.rating_comment ).success(function(data) {
                 $route.reload(); 
             });
          }

}]);

restaurantProject.run(['$rootScope', '$location', '$cookieStore', '$http', '$route',
    function ($rootScope, $location, $cookieStore, $http, $route) {
        // keep user logged in after page refresh
        $rootScope.globals = $cookieStore.get('globals') || {};
        if ($rootScope.globals.currentUser) {
            $http.defaults.headers.common['Authorization'] = 'Basic ' + $rootScope.globals.currentUser.authdata; // jshint ignore:line
        }
        $rootScope.$on('$locationChangeStart', function (event, next, current) {
            // redirect to login page if not logged in            
            if ($location.path() === '/signup') {
                $location.path('/signup');
            }                
            else if ($location.path() !== '/login' && !$rootScope.globals.currentUser) {
                $location.path('/login');
            }                            
        });       
}]);