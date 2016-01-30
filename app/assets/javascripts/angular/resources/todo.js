angular
.module("application")
.factory("Todo", [
    "$resource",
    function($resource) {
      return $resource(
        '/todos/:id',
        {id: '@id', format: 'json'}
      );
    }
]);
