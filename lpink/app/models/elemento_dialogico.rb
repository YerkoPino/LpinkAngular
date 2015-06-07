class ElementoDialogico < ActiveRecord::Base
  belongs_to :tipo_elemento
  belongs_to :actum
  belongs_to :tema
end
