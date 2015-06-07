class CreateParticipanteProyectos < ActiveRecord::Migration
  def change
    create_table :participante_proyectos do |t|
      t.references :participante, index: true, foreign_key: true
      t.references :proyecto, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
