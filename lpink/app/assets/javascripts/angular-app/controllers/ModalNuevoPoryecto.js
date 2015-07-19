angular.module('principalModule').controller('ModalNuevoProyecto', function ($scope,$rootScope,$modalInstance, items, DataService, $http, $q) {

	$scope.agregar = [];

	$scope.participantes = DataService.getTodosParticipantes();

	angular.forEach($scope.participantes,function(item){
		this.push({
			"id":item.id,
			"nombre":item.participante_nombre,
			"apellido":item.participante_apellido,
			"estado":false,
		});
	},$scope.agregar);

	$scope.items = items;
	$scope.selected = {
		item: $scope.items[0]
	};
	
	$scope.ok = function () {

		var proyecto = {
			"proyecto":{
				"proyecto_nombre":$scope.nombreProyecto,
				"proyecto_descripcion":$scope.descripcionProyecto
			}
		};

		var post = $http.post("/proyectos/create.json",proyecto).success(function(data, status, headers, config){
			
			angular.forEach($scope.agregar,function(item){
				if(item.estado){

					var proParticipante = {
						"proyectoParticpante":{
							"participante_id":item.id,
							"proyecto_id":data.id
						}
					};

					$http.post("/proyectos/createParticipantes.json",proParticipante);

				}
			});

			$rootScope.$emit('parent');
		});

		$modalInstance.close($scope.selected.item);
	};

	$scope.cancel = function () {
	    $modalInstance.dismiss('cancel');
	};
});