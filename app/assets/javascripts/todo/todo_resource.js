(function() {
  'use strict';

  angular
  .module('application')
  .factory('Todo', Todo);

  Todo.$inject = ['$resource'];

  function Todo($resource) {
    return $resource('/api/todos/:id', {id: '@id', format: 'json'});
  }

})();
