class ParticipanteActum < ActiveRecord::Base
  belongs_to :participante
  belongs_to :actum
end
