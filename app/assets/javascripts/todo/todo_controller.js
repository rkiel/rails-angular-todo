(function() {
  'use strict';

  angular
  .module('application')
  .controller('TodoController', TodoController);

  TodoController.$inject = ['$log','Todo'];

  function TodoController($log,Todo) {

    var vm = this;
    vm.description =  '';
    vm.items = Todo.query();
    vm.remove = remove;
    vm.add = add;

    function index() {
      return Todo
             .query()
             .$promise
             .then(function success(results) {
                     vm.items = results;
                   });
    }

    function remove(id) {
      Todo
      .remove({id: id})
      .$promise
      .then(index);
    }


    function add() {
      Todo
      .save({description: vm.description})
      .$promise
      .then(index);
      vm.description = '';
    }

  }

})();
