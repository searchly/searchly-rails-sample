'use strict';

controllers.controller("SearchController", ['$scope', '$http', function ($scope, $http) {
    $scope.search = function () {
        $http.get('restaurants/search.json', { params: {query: $scope.query}}).
            success(function (hits, status) {
                $scope.status = status;
                $scope.restaurants = hits;
            }).
            error(function (response, status) {
                alert(response);
            });
    };
}]);