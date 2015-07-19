class MultiParticipante < ActiveRecord::Migration
  def change

  	ParticipanteProyecto.create(proyecto_id: '1', participante_id: '1')
  	ParticipanteProyecto.create(proyecto_id: '1', participante_id: '2')
  	ParticipanteProyecto.create(proyecto_id: '1', participante_id: '8')
  	ParticipanteProyecto.create(proyecto_id: '1', participante_id: '9')
  	ParticipanteProyecto.create(proyecto_id: '2', participante_id: '3')
    ParticipanteProyecto.create(proyecto_id: '2', participante_id: '7')
    ParticipanteProyecto.create(proyecto_id: '2', participante_id: '12')
    ParticipanteProyecto.create(proyecto_id: '2', participante_id: '13')
    ParticipanteProyecto.create(proyecto_id: '3', participante_id: '4')
    ParticipanteProyecto.create(proyecto_id: '3', participante_id: '5')
    ParticipanteProyecto.create(proyecto_id: '3', participante_id: '6')
    ParticipanteProyecto.create(proyecto_id: '3', participante_id: '10')
    ParticipanteProyecto.create(proyecto_id: '3', participante_id: '11')

  end
end
