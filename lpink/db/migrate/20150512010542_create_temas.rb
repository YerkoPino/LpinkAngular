class CreateTemas < ActiveRecord::Migration
  def change
    create_table :temas do |t|
      t.integer :tema_correlativo
      t.text :tema_descripcion
      t.string :tema_nombre
      t.references :actum, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
