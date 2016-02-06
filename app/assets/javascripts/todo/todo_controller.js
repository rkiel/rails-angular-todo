(function() {
  'use strict';

  angular
  .module("application")
  .controller("TodoController", TodoController);

  TodoController.$inject = ["$scope","$log","Todo"];

  function TodoController($scope,$log,Todo) {

    function index() {
      return Todo
             .query()
             .$promise
             .then(function success(results) {
                     $scope.vm.items = results;
                   });
    }

    $scope.vm = {
      description: "",
      items: Todo.query()
    }

    $scope.remove = function(id) {
      Todo
      .remove({id: id})
      .$promise
      .then(index);
    }


    $scope.add = function() {
      Todo
      .save({description: $scope.vm.description})
      .$promise
      .then(index);
      $scope.vm.description = "";
    }

  }

})();
