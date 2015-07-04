class SessionsController < ApplicationController
  def new
  end

  def create  
    user = Participante.authenticate(params[:participante_email], params[:password])  
    if user  
      session[:participante_id] = user.id  
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
