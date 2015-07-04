class CreateProyectos < ActiveRecord::Migration
  def change
    create_table :proyectos do |t|
      t.string :proyecto_nombre
      t.string :proyecto_descripcion

      t.timestamps null: false
    end
  end
end
