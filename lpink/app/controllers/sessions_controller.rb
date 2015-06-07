class SessionsController < ApplicationController
  def new  
    if current_user
      redirect_to proyectos_path
    end
  end  
    
  def create  
    participante = Participante.authenticate(params[:email], params[:password])  
    if participante  
      session[:participante_id] = participante.id  
      redirect_to proyectos_path, :notice => "Logged in!"  
    else  
      flash.now.alert = "Invalid email or password"  
      render "new"  
    end  
  end 

  def destroy  
	  session[:participante_id] = nil  
	  redirect_to root_url, :notice => "Logged out!"  
	end  
end
