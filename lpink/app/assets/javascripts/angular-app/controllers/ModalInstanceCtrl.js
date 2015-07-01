angular.module('principalModule').controller('ModalInstanceCtrl', function ($scope,$rootScope,$modalInstance, items, DataService, $http, $q) {


 // Para la fecha
 $scope.formats = ['dd-MMMM-yyyy', 'yyyy/MM/dd', 'dd.MM.yyyy', 'shortDate'];
 $scope.format = $scope.formats[0];

 // Obtiene los usuarios del proyecto
 $scope.usuarios = DataService.getUsuariosProyecto();

$scope.usuariosSeleccionados = [];

// ciclo for

angular.forEach($scope.usuarios, function(item) {
  this.push({
    "participante_iniciales":item.participante_iniciales, 
    "id":item.id,
    "participante_foto":item.participante_foto,
    "estado":false,

});
}, $scope.usuariosSeleccionados);
console.log($scope.usuariosSeleccionados);

// Obtiene la hora
 $scope.today = function() {
   $scope.dt = new Date();
 };
 $scope.today(); 

/* Disable weekend selection
 $scope.disabled = function(date, mode) {
   return ( mode === 'day' && ( date.getDay() === 0 || date.getDay() === 6 ) );
 };
*/

 $scope.toggleMin = function() {
   $scope.minDate = $scope.minDate ? null : new Date();
 };
 $scope.toggleMin();

 $scope.open = function($event) {
   $event.preventDefault();
   $event.stopPropagation();

   $scope.opened = true;
 };


 $scope.dateOptions = {
    formatYear: 'yy',
    startingDay: 1
  };

  var tomorrow = new Date();
  tomorrow.setDate(tomorrow.getDate() + 1);
  var afterTomorrow = new Date();
  afterTomorrow.setDate(tomorrow.getDate() + 2);
  $scope.events =
    [
      {
        date: tomorrow,
        status: 'full'
      },
      {
        date: afterTomorrow,
        status: 'partially'
      }
    ];

    $scope.getDayClass = function(date, mode) {
    if (mode === 'day') {
      var dayToCheck = new Date(date).setHours(0,0,0,0);

      for (var i=0;i<$scope.events.length;i++){
        var currentDay = new Date($scope.events[i].date).setHours(0,0,0,0);

        if (dayToCheck === currentDay) {
          return $scope.events[i].status;
        }
      }
    }

    return '';
  };

  // Para tomar las horas 
    $scope.mytime = new Date();
    $scope.hstep = 1;
    $scope.mstep = 15;
    $scope.mytimeInicio = new Date();
    $scope.mytimeTermino = new Date(); 
    var minutosInicio = $scope.mytimeInicio.getMinutes() + 15;
    $scope.mytimeTermino.setMinutes(minutosInicio);

//  Datos para crear una nueva acta
    $scope.proyecto = DataService.getProyecto();
    $scope.actaFinal = DataService.getActaCorrelativo();
    $scope.nuevaActa = $scope.actaFinal + 1;
    $scope.fecha;
    $scope.inicio;
    $scope.termino;
    $scope.asistentes = [];
    $scope.ausentes = [];


   $scope.changed = function () {
    console.log('Time changed to: ' + $scope.mytime);
  };

  $scope.items = items;
  $scope.selected = {
    item: $scope.items[0]
  };


  $scope.funOk = function(){

    var primera = $scope.ok();
    $q.all(primera).then(function(){
       $rootScope.$emit('parent');
    });

  }



  /*
    
    Funcion ok que ejecuta el boton de nueva acta
    
  */


  $scope.ok = function () {

    $scope.fecha = $scope.dt;
    $scope.inicio = $scope.mytimeInicio;
    $scope.termino = $scope.mytimeTermino;


    // Construye el Json para enviar la informacion de las actas

    var dataObj = {

          "acta":{

            "acta_correlativo" : $scope.nuevaActa , 
            "acta_fecha" : $scope.fecha ,
            "acta_inicio" : $scope.inicio ,
            "acta_termino" : $scope.termino , 
            "proyecto_id": $scope.proyecto

          }
          
    };

   var res = $http.post('/acta/create.json', dataObj).success(function(data, status, headers, config) {
        console.log('post success');
        console.log('data');
        console.log(data);
        console.log('Valor de id dentro de data');
        console.log(data.id);
        DataService.ActualizaActaId(data.id);
        // Inserta el nuevo valor en el vector local
        var dato = [{

          id: data.id,
          acta_correlativo: data.acta_correlativo,
          acta_fecha: data.acta_fecha,
          acta_inicio: data.acta_inicio,
          acta_termino: data.acta_termino,
          proyecto_id: data.proyecto_id,
          created_at: data.created_at,
          updated_at: data.updated_at
        }]

        DataService.ActualizarActasProyecto(dato);
        console.log('Valor del DataService');
        console.log(DataService.getActaId());
        console.log('status');
        console.log(status);
        console.log('headers');
        console.log(headers);
        console.log('config');
        console.log(config);


        angular.forEach($scope.usuariosSeleccionados, function(item) {

         var dataAsistencia = {

           "usuario":{
             "participante_id" : item.id,
             "actum_id": data.id,
             "participante_acta_estado" :item.estado,
           }

         };

         $http.post('/principal/createAsistencia.json', dataAsistencia).success(function(data, status, headers, config) {

            // Agregar cada envio a la lista de los push

            var datoAsistencia = [{

                id: data.id,
                participante_nombre: data.participante_nombre,
                participante_apellido: data.participante_apellido,
                participante_iniciales: data.participante_iniciales,
                participante_foto: data.participante_foto,
                actum_id: data.actum_id,
                participante_acta_estado: data.participante_acta_estado,
                acta_correlativo: data.acta_correlativo

            }]

            DataService.ActualizarUsuariosActa(datoAsistencia);
            console.log('Valor obtenido desde el post al crear asistente '+datoAsistencia);
            DataService.ActualizaActaCorrelativo(DataService.getActaCorrelativo());
         })

          $rootScope.$emit('parent');

         });
  
  
    });
   

  // Fin envio informacion basica del acta

  // Envia la informacion de asistencia de cada usuario

  // Fin envio asistencia

  DataService.ActualizarActaActiva(DataService.getActaActiva + 1);
  DataService.ActualizaActaCorrelativo(DataService.getActaCorrelativo + 1);

    $modalInstance.close($scope.selected.item);
  };


  $scope.cancel = function () {
    $modalInstance.dismiss('cancel');
  };
});
