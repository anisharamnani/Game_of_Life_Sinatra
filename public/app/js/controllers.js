'use strict';

var gameoflifeControllers = angular.module('gameoflifeControllers', []);

gameoflifeApp.controller('RandBoardCtrl',['$scope', '$http', '$timeout',
  function($scope, $http, $timeout){
    $http.get('http://localhost:4000/random_board').success(function(data){
      $scope.boards = data;
      var loading = false;

      var nextMove = function(){
        $scope.boards.shift();
        $timeout(nextMove, 1000);
        if ($scope.boards.length < 20 && loading == false){
          $http.get("http://localhost:4000/tick_board").success(function(data){
            $scope.boards = $scope.boards.concat(data);
            loading = true
          });
        }
      }

      nextMove();
    });
  }]);