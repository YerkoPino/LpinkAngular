class ParticipanteProyecto < ActiveRecord::Base
  belongs_to :participante
  belongs_to :proyecto
end
