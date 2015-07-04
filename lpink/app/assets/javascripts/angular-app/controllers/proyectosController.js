angular.module('principalModule').controller('proyectosController',[ '$scope' ,'$http', 'DataService', '$rootScope', function($scope,$http, DataService, $rootScope ){

	$scope.proyectos = [];

	$scope.proyectos = DataService.getProyectos.query();

}]);