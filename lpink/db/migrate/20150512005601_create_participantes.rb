class CreateParticipantes < ActiveRecord::Migration
  def change
    create_table :participantes do |t|
      t.string :participante_nombre
      t.string :participante_apellido
      t.string :participante_iniciales
      t.string :participante_foto
      t.string :participante_rut

      t.string :email
      t.string :tipo
      t.string :password_hash
      t.string :password_salt

    end
  end
end
