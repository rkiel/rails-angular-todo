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
                     scope.vm.items = results;
                   });
    }

    scope.vm = {
      description: "",
      items: Todo.query()
    }

    scope.remove = function(id) {
      Todo
      .remove({id: id})
      .$promise
      .then(index);
    }


    scope.add = function() {
      Todo
      .save({description: scope.vm.description})
      .$promise
      .then(index);
      scope.vm.description = "";
    }

  }

})();
