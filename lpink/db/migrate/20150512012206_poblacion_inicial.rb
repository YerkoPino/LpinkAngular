class PoblacionInicial < ActiveRecord::Migration
  def change

  	# TipoElemento

  	TipoElemento.create( tipo_nombre: "Acuerdo")
  	TipoElemento.create( tipo_nombre: "Desacuerdo")
  	TipoElemento.create( tipo_nombre: "Duda")
  	TipoElemento.create( tipo_nombre: "Compromiso")

  	# Proyecto

  	Proyecto.create( proyecto_nombre: "L-pink - Grupo 1", proyecto_descripcion: "Parte del proyecto L-pink correspondiente al grupo 1.")
  	Proyecto.create( proyecto_nombre: "L-pink - Grupo 2", proyecto_descripcion: "Parte del proyecto L-pink correspondiente al grupo 2.")
  	Proyecto.create( proyecto_nombre: "L-pink - Grupo 3", proyecto_descripcion: "Parte del proyecto L-pink correspondiente al grupo 3.")

  	# Participantes

  	Participante.create( participante_nombre: "José" , participante_apellido: "Cortés", participante_iniciales: "JC", participante_foto: "perfil.jpg", participante_email: "jose.cortes@usach.cl", password: "12345678", password_confirmation: "12345678")
    Participante.create( participante_nombre: "Álex" , participante_apellido: "Gárate", participante_iniciales: "AG", participante_foto: "perfil.jpg", participante_email: "alex.garate@usach.cl", password: "12345678", password_confirmation: "12345678")
    Participante.create( participante_nombre: "Camilo" , participante_apellido: "Jimenez", participante_iniciales: "CJ", participante_foto: "camiloJimenez.jpg", participante_email: "camilo.jimenez@usach.cl", password: "12345678", password_confirmation: "12345678")
    Participante.create( participante_nombre: "Chien-Hung" , participante_apellido: "Lin", participante_iniciales: "CL", participante_foto: "perfil.jpg", participante_email: "chienhung.lin@usach.cl", password: "12345678", password_confirmation: "12345678")
    Participante.create( participante_nombre: "Fernanda" , participante_apellido: "Lobos", participante_iniciales: "FL", participante_foto: "perfil.jpg", participante_email: "maria.lobos@usach.cl", password: "12345678", password_confirmation: "12345678")
    Participante.create( participante_nombre: "Luis" , participante_apellido: "Loyola", participante_iniciales: "LL", participante_foto: "perfil.jpg", participante_email: "luis.loyola@usach.cl", password: "12345678", password_confirmation: "12345678")
    Participante.create( participante_nombre: "Gonzalo" , participante_apellido: "Martinez", participante_iniciales: "GM", participante_foto: "gonzaloMartinez.jpg", participante_email: "gonzalo.martinez@usach.cl", password: "12345678", password_confirmation: "12345678")
    Participante.create( participante_nombre: "Sebastián" , participante_apellido: "Meza", participante_iniciales: "SM", participante_foto: "perfil.jpg", participante_email: "sebastian.meza@usach.cl", password: "12345678", password_confirmation: "12345678")
    Participante.create( participante_nombre: "Yerko" , participante_apellido: "Pino", participante_iniciales: "YP", participante_foto: "perfil.jpg", participante_email: "yerko.pino@usach.cl", password: "12345678", password_confirmation: "12345678")
    Participante.create( participante_nombre: "Matías" , participante_apellido: "Quinteros", participante_iniciales: "MQ", participante_foto: "perfil.jpg", participante_email: "matias.quinteros@usach.cl", password: "12345678", password_confirmation: "12345678")
    Participante.create( participante_nombre: "Benjamín" , participante_apellido: "Ruiz-Tagle", participante_iniciales: "BR", participante_foto: "perfil.jpg", participante_email: "benjart91@gmail.com", password: "12345678", password_confirmation: "12345678")
    Participante.create( participante_nombre: "Ismael" , participante_apellido: "Vicencio", participante_iniciales: "IV", participante_foto: "ismaelVicencio.jpg", participante_email: "ismael.vicencio@usach.cl", password: "12345678", password_confirmation: "12345678")
  	Participante.create( participante_nombre: "Daniel" , participante_apellido: "Vargas", participante_iniciales: "DV", participante_foto: "danielVargas.jpg", participante_email: "daniel.vargas@usach.cl", password: "12345678", password_confirmation: "12345678")
    Participante.create( participante_nombre: "Cristobal" , participante_apellido: "Vasquez", participante_iniciales: "CV", participante_foto: "perfil.jpg", participante_email: "cristobal.vasquez@usach.cl", password: "12345678", password_confirmation: "12345678")
    Participante.create( participante_nombre: "Edmundo" , participante_apellido: "Leiva", participante_iniciales: "EL", participante_foto: "perfil.jpg", participante_email: "epleiva@gmail.com", password: "12345678", password_confirmation: "12345678")
  	

  end
end
