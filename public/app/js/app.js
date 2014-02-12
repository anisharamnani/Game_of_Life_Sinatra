'use strict';

var gameoflifeApp = angular.module('gameoflifeApp',[
  'ngRoute', 
  'gameoflifeControllers'
  ]);

gameoflifeApp.config(['$routeProvider', 
  function($routeProvider){
    $routeProvider.
      when('/random', {
        templateUrl: 'partials/randomBoard.html',
        controller: 'RandBoardCtrl'
      }).
      otherwise({
        redirectTo: '/random'
      });
  }]);