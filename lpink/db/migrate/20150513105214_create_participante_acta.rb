class CreateParticipanteActa < ActiveRecord::Migration
  def change
    create_table :participante_acta do |t|
      t.references :participante, index: true, foreign_key: true
      t.references :actum, index: true, foreign_key: true
      t.boolean :participante_acta_estado

      t.timestamps null: false
    end
  end
end
