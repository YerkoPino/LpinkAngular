class MultiParticipante < ActiveRecord::Migration
  def change

  	ParticipanteProyecto.create(proyecto_id: '1', participante_id: '1')
  	ParticipanteProyecto.create(proyecto_id: '1', participante_id: '2')
  	ParticipanteProyecto.create(proyecto_id: '1', participante_id: '3')
  	ParticipanteProyecto.create(proyecto_id: '1', participante_id: '4')
  	ParticipanteProyecto.create(proyecto_id: '2', participante_id: '5')

  	ParticipanteActum.create(participante_id: '1', actum_id: '1', participante_acta_estado: "true")
  	ParticipanteActum.create(participante_id: '1', actum_id: '2', participante_acta_estado: "false")
    ParticipanteActum.create(participante_id: '1', actum_id: '3', participante_acta_estado: "true")
  	ParticipanteActum.create(participante_id: '2', actum_id: '1', participante_acta_estado: "true")
  	ParticipanteActum.create(participante_id: '2', actum_id: '2', participante_acta_estado: "false")
    ParticipanteActum.create(participante_id: '2', actum_id: '3', participante_acta_estado: "true")
    ParticipanteActum.create(participante_id: '3', actum_id: '3', participante_acta_estado: "true")
    ParticipanteActum.create(participante_id: '4', actum_id: '3', participante_acta_estado: "true")
  	ParticipanteActum.create(participante_id: '3', actum_id: '1', participante_acta_estado: "false")
  	ParticipanteActum.create(participante_id: '3', actum_id: '2', participante_acta_estado: "true")
  	ParticipanteActum.create(participante_id: '4', actum_id: '1', participante_acta_estado: "false")
  	ParticipanteActum.create(participante_id: '4', actum_id: '2', participante_acta_estado: "true")
  	ParticipanteActum.create(participante_id: '5', actum_id: '4', participante_acta_estado: "true")
  	ParticipanteActum.create(participante_id: '5', actum_id: '5', participante_acta_estado: "true")

  end
end
