angular.module('principalModule').controller('actasController',[ '$scope' ,'$http', 'DataService', function($scope, $http, DataService){


  // Variables de datos 
  $scope.datos = [] // Todas las actas del proyecto actual
  $scope.cantidadActas = 1; // Contiene la cantidad de actas en total del proyecto
  $scope.proyecto = 1; // Contiene el id del proyecto actual

  // Almacena los usuarios del proyecto
  // Solo se utiliza como base para pasar asistencia en cada acta
  $scope.user = [];

  // Almacena los temas tratados en el proyecto
  $scope.temas = [];

 // Almacena los elementos dialogicos de cada acta del proyecto
  $scope.dialogicos = [];


	// pagination controls
	$scope.currentPage = 1; // Pagina Actual e Inicial
	$scope.totalItems = 1000// Cantidad de item a paginar, tiene que ser igual a la cantidad de Actas
	$scope.entryLimit = 1; // Item por pagina
	$scope.noOfPages = 5;  // Maxima cantidad de paginas en el scroll del paginador	

    
  /*  
      Obtiene informacion sobre la cantidad de actas 
      Recuepera los datos de las actas desde la base de datos mediante JSon servidos por Rails
  */

    $scope.cantidadActas = $http.get('acta/cantidadActas.json?parametro='+$scope.proyecto).success(function(data){

              // Se obtiene informacion del proyecto, como ejemplo se asigna el valor 1
              DataService.ActualizarProyecto(1);
              // Se obtiene el proyecto sobre el cual se desea desplegar la informacion
              $scope.proyecto = DataService.getProyecto();

              // Se obtiene la informacion inicial de las actas

              // Se actualiza la acta a desplegar
              DataService.ActualizarActaActiva(1);

              // Se obtienen todas las actas de un proyecto dado     
              $scope.datos = DataService.getActas.query();

              // Se almacenan las actas en el service para que esten disponibles para todos los controladores
              DataService.generarActasProyecto($scope.datos);

              // Se obtiene la cantidad de actas del prooyecto
              //$scope.cantidadActas = DataService.getCantidad2;
              //$scope.cantidadActas = DataService.getActas.query.length-1;

        console.log('Valor de cantidad recogido por el service en el factory: ');
        console.log(data.cantidad)
        DataService.ActualizaActaCorrelativo(data.cantidad);

              $scope.cantidadActas = DataService.getActaCorrelativo();
            
              // Se actualiza la cantidad de actas del proyecto para la disponibilidad en el service
              DataService.ActualizaActaCorrelativo($scope.cantidadActas);

              // Actualiza el valor de item total a mostrar en el paginador
              $scope.totalItems = DataService.getActaCorrelativo();

              //  Se obtiene la informacion inicial de los elementos dialogicos de todo el proyecto

              $scope.dialogicos = DataService.getDialogicos.query();

              // Se obtienen los datos sobre los usuarios y su participacion en la acta

              $scope.user = DataService.getUsers.query();
              // Se almacenan los usuarios en el service
              DataService.generarUsuariosActa($scope.user);

              // Se obtiene la informacion sobre los usuarios del proyecto
              $scope.usuariosProyecto = DataService.getUsersProyectos.query();
              // Se almacena los usuarios base del proyecto en el service
              DataService.generarUsuariosProyecto($scope.usuariosProyecto);

      });
      


  // filtros para los ng-repeat    


  $scope.matias = function(a,b){

    if(a.actum_id == b.id)
      return true;
    return false;

  }

	$scope.call = function(a){
	
	    if (a.acta_correlativo == $scope.currentPage)
	        return true;
	    return false;
	                
	}

	$scope.pendiente = function(a){

		if (a.dialogico_estado == "Pendiente" && a.acta_correlativo<= $scope.currentPage)
			return true;
		return false;
	}

	$scope.presente = function(a){

		if (a.participante_acta_estado == "1" && a.acta_correlativo == $scope.currentPage)
			return true;
		return false;
	}

	$scope.ausente = function(a){

		if (a.participante_acta_estado == "0" && a.acta_correlativo == $scope.currentPage)
			return true;
		return false;
	}

	
}]); // Fin del Controlador

