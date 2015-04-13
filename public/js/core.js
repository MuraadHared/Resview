var restaurantProject = angular.module('restaurantProject', ['ngRoute', 'ngAnimate', 'Authentication', 'ngCookies', 'datatables', 'angular-input-stars']);

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
        .when('/viewMenuItem', 
            {
                controller: 'RestaurantController',
                templateUrl: 'html/viewMenuItem.html'
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
                $rootScope.rater = {};
                $rootScope.itemRating = {};
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
            $scope.resetRatingStars();
            $http.get('/rating/' + restaurant.restaurantid).success(function(data) {                
                $rootScope.viewRestaurantRatings = data;                                
            });            
            $http.get('/getMenuItems/' + restaurant.restaurantid).success(function(data) {                                
                $rootScope.viewRestaurantItems = data;                                 
            });            
            $http.get('/getLocations/' + restaurant.restaurantid).success(function(data) {                                
                $rootScope.locationData = data;                                            
            });            
            $location.path('/viewRestaurant');
        }

          $scope.updateViewingItem = function(item) {             
            $rootScope.viewItemInfo = item;                       
            $scope.resetRatingStars();
             $http.get('/getRatingItems/' + item.itemid).success(function(data) {                                
                $rootScope.viewItemRatings = data;
            });                
            $location.path('/viewMenuItem');
        }

        $scope.deleteRestaurant = function(restaurant) {            
            $http.get('/deleteRestaurant/' + restaurant.restaurantid).success(function(data) {
                $http.get('/restaurant').success(function(data) {            
                    $scope.restaurantList = data;                                                                                          
                    $route.reload();
                });                            
            });                                 
        }

        $scope.deleteRater = function(rater) {            
           $http.get('/deleteRater/' + rater.userid).success(function(data) {                
                $http.get('/getRaters').success(function(data) {            
                    $scope.raterList = data;                                
                    $route.reload();         
                });
            });           
        }

        $scope.deleteMenuItem = function(item) {                                    
            $http.get('/deleteMenuItem/' + item.itemid).success(function(data) {
                $http.get('/getMenuItems/' + $scope.viewRestaurantInfo.restaurantid).success(function(data) {                                
                    $rootScope.viewRestaurantItems = data; 
                    $route.reload();
                });                           
            });                                 
        }

         $scope.addMenuItem = function(item) {            
            $http.get('/deleteMenuItem/' + item.itemid).success(function(data) {
                $http.get('/getMenuItems/' + item.restaurantid).success(function(data) {            
                    $rootScope.viewRestaurantItems = data; 
                    $route.reload();
                });                           
            });                                 
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
                    restInfo.nameOfRestaurant = " ";
                    restInfo.typeOfRestaurant = " ";
                    restInfo.url = " ";                
                })
            });                        
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
        }

        $scope.getRatingItems = function(item) {            
           $http.get('/getRatingItems/' + item.itemid).success(function(data) {                
                $scope.ratingItemData = data;
            });
        }

        $scope.insertRating = function(rater) {              
             $http.get('/insertRating/' + $rootScope.globals.currentUser.userid + '/' + $scope.viewRestaurantInfo.restaurantid + '/' + escape(rater.comments) + '/' + rater.price + '/' + rater.food + '/' + rater.mood + '/' + rater.staff ).success(function(data) {
                $http.get('/rating/' + $scope.viewRestaurantInfo.restaurantid).success(function(data) {                
                    $rootScope.viewRestaurantRatings = data;
                    $route.reload();
                });
             });
          }

          $scope.insertRatingItem = function(rater) {          
            console.log(rater);
             $http.get('/insertRatingItem/' + $rootScope.globals.currentUser.userid + '/' + $scope.viewItemInfo.itemid + '/' + rater.rating + '/' + escape(rater.comments) ).success(function(data) {
                $http.get('/getRatingItems/' + $scope.viewItemInfo.itemid).success(function(data) {                
                    $rootScope.viewItemRatings = data;
                    $route.reload();
                });
             });
          }

          $scope.resetRatingStars = function() {
            $rootScope.itemRating.rating = 1;  
            $rootScope.rater.price = 1;            
            $rootScope.rater.food = 1;
            $rootScope.rater.mood = 1;
            $rootScope.rater.staff = 1;
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