angular.module('principalModule').factory('DataService', ['$resource','$http', function($resource, $http){

	var factory = {}; 

	// Contiene el proyecto actual sobre el cual se trabaja
	factory.proyectos = 1; 

	// Contiene el acta actual de trabajo
	factory.ActaActiva = 1;

	// Contiene la cantidad de actas del proyecto
	factory.ActaTotalCorrelativo = 16;

	factory.ActaActivaId = 1;

	// Contiene la informacion de cada acta, tema y elementos dialogicos del proyecto
	factory.ActasProyecto = [];

	factory.TemasProyecto = [];

	factory.ElementosProyecto = [];

	// Almacena la asistencia y datos de los usuarios
	factory.UserActas = [];


	// Almacena los usuarios para pasar asistencia
	factory.UsuariosProyecto = [];


	factory.Cambio = 0;

	// Funciones para actualizar y obtener informacion de los contenedores globaless

	factory.getCambio = function(){

		return factory.Cambio;
	}

	factory.ActualizarCambio = function (id){
		factory.Cambio = id;
	}

	factory.generarUsuariosActa = function (objeto){

		factory.UserActas = objeto;
	}

	factory.ActualizarUsuariosActa = function (objeto){

		factory.UserActas.push(objeto);

	}

	factory.getUsuariosActa = function (){

		return factory.UserActas;
	}

	factory.generarUsuariosProyecto = function (objeto){

		factory.UsuariosProyecto = objeto;
	}

	factory.ActualizarUsuariosProyecto = function (objeto){

		factory.UsuariosProyecto.push(objeto);

	}

	factory.getUsuariosProyecto = function (){

		return factory.UsuariosProyecto;
	}


	factory.generarActasProyecto = function (objeto){

		factory.ActasProyecto = objeto;
	}

	factory.ActualizarActasProyecto = function (objeto){

		factory.ActasProyecto.push(objeto);

	}

	factory.getActasProyecto = function (){

		return factory.ActasProyecto;
	}

	factory.generarTemasProyecto = function (objeto){

		factory.TemasProyecto = objeto;
	}

	factory.ActualizarTemasProyecto = function (objeto){

		factory.TemasProyecto.push(objeto);

	}

	factory.getTemasProyecto = function (){

		return factory.TemasProyecto;
	}

	factory.generarElementosProyecto = function (objeto){

		factory.ElementosProyecto = objeto;

	}

	factory.ActualizarElementosProyecto = function (objeto){

		factory.ElementosProyecto.push(objeto);

	}

	factory.getElementossProyecto = function (){

		return factory.ElementosProyecto;
	}


	// Obtiene todas las actas y sus datos correspondientes para un proyecto X

	factory.getActas = $resource('acta/index.json?parametro='+factory.proyectos, {}, {
        'query': {method: 'GET', isArray: true}
    });

    // Obtiene la cantidad de actas que tiene un proyecto -- No se utiliza

	factory.getCantidad = $resource('acta/cantidadActas.json?parametro='+factory.proyectos, {}, {
        'query': {method: 'GET', isArray: false}
    });


	factory.getUltima = $resource('acta/ultimaActa.json', {}, {
        'query': {method: 'GET', isArray: false}
    });

	// Pendiente de modificacion - retorna todos los elementos dialogicos de la base de datos

	factory.getDialogicos = $resource('dialogico/index.json',{},{
		'query': {method: 'GET', isArray: true}

	})

	factory.getUsers = $resource('principal/usuarios.json?argumento1='+factory.proyectos,{},{
		'query': {method: 'GET', isArray: true}

	})

	factory.getUsersProyectos = $resource('principal/usuariosProyecto.json?proyecto='+1,{},{
		'query': {method: 'GET', isArray: true}

	})

	factory.getUsersActas = $resource('principal/usuariosActa.json',{},{
		'query': {method: 'GET', isArray: true}

	})


	factory.getAlgo = $resource('pagina para obtener el recurso',{},{
		'query': {method: 'GET', isArray: true}

	})

	factory.ActualizarProyecto = function (id){

		factory.proyectos = id;

	}

	factory.getProyecto = function(){

		return factory.proyectos;
	}

	factory.ActualizarActaActiva = function (id){

		factory.ActaActiva = id;
	}

	factory.getActaActiva = function (){

		return factory.ActaActiva;
	}

	factory.ActualizaActaCorrelativo = function (id){

		factory.ActaTotalCorrelativo = id;
		
	}

	factory.getActaCorrelativo = function (){

		return factory.ActaTotalCorrelativo;
	}

	factory.ActualizaActaId = function (id){

		factory.ActaActivaId = id;
		
	}

	factory.getActaId = function (){

		return factory.ActaActivaId;
	}


    return factory;


}])





