class ParticipantesController < ApplicationController

  before_action :set_participante, only: [:edit,:show,:update]

  def new  
    @participante = Participante.new  
  end  
    
  def create  
    @participante = Participante.new(participante_params)  
    if @participante.save  
      redirect_to root_url, :notice => "Signed up!"  
    else  
      render "new"  
    end  
  end 

  def show    
  end

  def edit    
  end

  def participante_params
    params.require(:participante).permit(:participante_nombre, :participante_apellido, :email, :tipo, :password, :password_confirmation,:participante_imagen,:participante_iniciales)
  end

  def set_participante
    @participante = Participante.find(params[:id])
  end
end
