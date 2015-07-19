angular.module('principalModule').controller('proyectosController',[ '$scope' ,'$http', 'DataService', '$rootScope', function($scope,$http, DataService, $rootScope ){

	$scope.proyectos = [];

	$scope.proyectos = DataService.getProyectos.query();

	$scope.usuarios = DataService.getParticipantes.query();

	DataService.ActualizarParticipante($scope.usuarios);

	$rootScope.$on('parent', function () {

        $scope.proyectos = DataService.getProyectos.query();
     
    });

}]);