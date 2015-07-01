class ParticipantesController < ApplicationController
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

  def participante_params
    params.require(:participante).permit(:participante_nombre, :participante_apellido, :participante_email, :password, :password_confirmation,:participante_foto,:participante_iniciales, :participante_rut)
  end
end
