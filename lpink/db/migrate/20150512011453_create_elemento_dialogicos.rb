class CreateElementoDialogicos < ActiveRecord::Migration
  def change
    create_table :elemento_dialogicos do |t|
      t.integer :dialogico_correlativo
      t.string :dialogico_nombre
      t.text :dialogico_referencia
      t.string :dialogico_estado
      t.references :tipo_elemento, index: true, foreign_key: true
      t.references :actum, index: true, foreign_key: true
      t.references :tema, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
