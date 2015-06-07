class CreateProyectos < ActiveRecord::Migration
  def change
    create_table :proyectos do |t|
      t.string :proyecto_nombre
      t.string :descripcion, limit: 300
      t.date :fecha_inicio
      t.date :fecha_fin
    end
  end
end
