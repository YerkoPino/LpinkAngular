class ParticipantesController < ApplicationController

  respond_to :json

  def new  
    @user = Participante.new  
  end  
    
  def create  
    @user = Participante.new(participante_params)  
    if @user.save  
      redirect_to proyectos_home_path, :notice => "Signed up!"  
    else  
      render "new"  
    end  
  end 

  def todos
    @participantes = Participante.find_by_sql("SELECT participantes.id, participantes.participante_nombre, participantes.participante_apellido FROM participantes")
    
    respond_to do |format|
      format.json { render json: @participantes }
    end
  end

  def participante_params
    params.require(:participante).permit(:participante_nombre, :participante_apellido, :participante_email, :password, :password_confirmation,:participante_foto,:participante_iniciales, :participante_rut)
  end
end
