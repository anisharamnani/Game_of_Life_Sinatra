'use strict';

var gameoflifeControllers = angular.module('gameoflifeControllers', []);

gameoflifeApp.controller('RandBoardCtrl',['$scope', '$http', '$timeout',
  function($scope, $http, $timeout){
    $http.get('http://localhost:4000/randomboard').success(function(data){
      $scope.boards = data;

      var nextMove = function(){
        $scope.boards.shift();
        $timeout(nextMove, 500);
      }

      nextMove();
    });
  }]);