'use strict';

var gameoflifeControllers = angular.module('gameoflifeControllers', []);

gameoflifeApp.controller('RandBoardCtrl',['$scope', '$http',
  function($scope, $http){
    $http.get('http://localhost:9393/random_board').success(function(data){
      $scope.boards = data;
    });
  }]);