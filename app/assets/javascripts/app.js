'use strict';

var railsSample = angular.module('rails-sample', [
    'templates',
    'ngRoute',
    'controllers',
]);

railsSample.config(['$routeProvider', function ($routeProvider) {
    $routeProvider.
        when('/', {templateUrl: 'index.html', controller: 'SearchController'}).
        when('/about', {templateUrl: 'about.html'}).
    otherwise({redirectTo: '/'});
}]);

var controllers = angular.module('controllers', [])