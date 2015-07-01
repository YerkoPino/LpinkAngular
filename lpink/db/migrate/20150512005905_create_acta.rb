class CreateActa < ActiveRecord::Migration
  def change
    create_table :acta do |t|
      t.integer :acta_correlativo
      t.date :acta_fecha
      t.time :acta_inicio
      t.time :acta_termino
      t.references :proyecto, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
