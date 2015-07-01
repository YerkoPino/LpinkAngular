class PoblacionInicial < ActiveRecord::Migration
  def change

  	# TipoElemento

  	TipoElemento.create( tipo_nombre: "Acuerdo")
  	TipoElemento.create( tipo_nombre: "Desacuerdo")
  	TipoElemento.create( tipo_nombre: "Duda")
  	TipoElemento.create( tipo_nombre: "Compromiso")

  	# Proyecto

  	Proyecto.create( proyecto_nombre: "L-pink" )
  	Proyecto.create( proyecto_nombre: "SendFast" )
  	Proyecto.create( proyecto_nombre: "Aldea Animal" )

  	# Participantes

  	Participante.create( participante_nombre: "Ismael" , participante_apellido: "Vicencio", participante_rut: "176807970", participante_iniciales: "IV", participante_foto: "ismaelVicencio.jpg")
  	Participante.create( participante_nombre: "Daniel" , participante_apellido: "Vargas", participante_rut: "111111111", participante_iniciales: "DV", participante_foto: "danielVargas.jpg")
  	Participante.create( participante_nombre: "Camilo" , participante_apellido: "Jimenez", participante_rut: "222222222", participante_iniciales: "CJ", participante_foto: "camiloJimenez.jpg")
  	Participante.create( participante_nombre: "Gonzalo" , participante_apellido: "Martinez", participante_rut: "333333333", participante_iniciales: "GM", participante_foto: "gonzaloMartinez.jpg")
    Participante.create( participante_nombre: "Cristobal" , participante_apellido: "Vasquez", participante_rut: "444444444", participante_iniciales: "CV", participante_foto: "perfil.jpg")
  	# Acta

  	Actum.create( proyecto_id: "1" , acta_fecha: "2015-05-10", acta_inicio: "19:30:00", acta_termino: '20:00:00', acta_correlativo: "1")
  	Actum.create( proyecto_id: "1" , acta_fecha: "2015-05-11", acta_inicio: "19:30:00", acta_termino: '20:00:00', acta_correlativo: "2")
  	Actum.create( proyecto_id: "1" , acta_fecha: "2015-05-12", acta_inicio: "19:30:00", acta_termino: '20:00:00', acta_correlativo: "3")
  	Actum.create( proyecto_id: "2" , acta_fecha: "2015-05-15", acta_inicio: "19:30:00", acta_termino: '20:00:00', acta_correlativo: "1")
  	Actum.create( proyecto_id: "2" , acta_fecha: "2015-05-16", acta_inicio: "19:30:00", acta_termino: '20:00:00', acta_correlativo: "2")
    
  	# Temas

  	Tema.create( tema_correlativo: "1", tema_descripcion: "Un tema", tema_nombre: "Tema 1", actum_id: "1" )
  	Tema.create( tema_correlativo: "2", tema_descripcion: "Un tema", tema_nombre: "Tema 2", actum_id: "1" )
  	Tema.create( tema_correlativo: "3", tema_descripcion: "Un tema", tema_nombre: "Tema 3", actum_id: "1" )
  	Tema.create( tema_correlativo: "4", tema_descripcion: "Un tema", tema_nombre: "Tema 4", actum_id: "1" )
  	Tema.create( tema_correlativo: "1", tema_descripcion: "Un tema", tema_nombre: "Tema 1", actum_id: "2" )
  	Tema.create( tema_correlativo: "2", tema_descripcion: "Un tema", tema_nombre: "Tema 2", actum_id: "2" )
  	Tema.create( tema_correlativo: "3", tema_descripcion: "Un tema", tema_nombre: "Tema 3", actum_id: "2" )
  	Tema.create( tema_correlativo: "4", tema_descripcion: "Un tema", tema_nombre: "Tema 4", actum_id: "2" )
  	
  	# Elementos dialogicos

  	ElementoDialogico.create( dialogico_correlativo: "1" , dialogico_nombre: "Compromiso 1" , dialogico_referencia: "Texto de referencia" , dialogico_estado: "Pendiente" , actum_id: "1", tipo_elemento_id: "4", tema_id: "1")
  	ElementoDialogico.create( dialogico_correlativo: "2" , dialogico_nombre: "Compromiso 2" , dialogico_referencia: "Texto de referencia" , dialogico_estado: "Pendiente" , actum_id: "1", tipo_elemento_id: "4", tema_id: "2")
  	ElementoDialogico.create( dialogico_correlativo: "3" , dialogico_nombre: "Acuerdo 1" , dialogico_referencia: "Texto de referencia" , dialogico_estado: "Pendiente" , actum_id: "1", tipo_elemento_id: "1", tema_id: "3")
  	ElementoDialogico.create( dialogico_correlativo: "1" , dialogico_nombre: "Desacuerdo 1" , dialogico_referencia: "Texto de referencia" , dialogico_estado: "Pendiente" , actum_id: "2", tipo_elemento_id: "2", tema_id: "5")
  	ElementoDialogico.create( dialogico_correlativo: "2" , dialogico_nombre: "Duda 1" , dialogico_referencia: "Texto de referencia" , dialogico_estado: "Pendiente" , actum_id: "2", tipo_elemento_id: "3", tema_id: "6")

  end
end
