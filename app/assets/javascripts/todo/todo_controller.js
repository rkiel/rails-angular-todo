(function() {
  'use strict';

  angular
  .module("application")
  .controller("TodoController", TodoController);

  TodoController.$inject = ["$log","Todo"];

  function TodoController($log,Todo) {

    var scope = this;

    function index() {
      return Todo
             .query()
             .$promise
             .then(function success(results) {
                     scope.items = results;
                   });
    }

    scope.description =  "";
    scope.items = Todo.query();

    scope.remove = function(id) {
      Todo
      .remove({id: id})
      .$promise
      .then(index);
    }


    scope.add = function() {
      Todo
      .save({description: scope.description})
      .$promise
      .then(index);
      scope.description = "";
    }

  }

})();
