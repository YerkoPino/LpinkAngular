class ProyectosController < ApplicationController

	skip_before_action :verify_authenticity_token
	respond_to :json

	def index

		@proyectos = Proyecto.all

		respond_to do |format|
			format.json { render json: @proyectos }
		end

	end

	def create
		@proyecto = Proyecto.new(proyecto_params)
		@proyecto.save
		respond_to do |format|
			format.json {render json: @proyecto}
		end
	end

	def createParticipantes
		@proParticipante = ParticipanteProyecto.new(participantes_params)
		@proParticipante.save
		respond_to do |format|
			format.json {render json: @proParticipante}
		end
	end

	def actual
		@proyecto_id = params[:id]
		@proyecto = Proyecto.where(:id => @proyecto_id)
		respond_to do |format|
			format.json {render json: @proyecto}
		end
	end

	private
	def proyecto_params
		params.require(:proyecto).permit(:proyecto_nombre,:proyecto_descripcion)
	end

	private
	def participantes_params
		params.require(:proyectoParticpante).permit(:participante_id,:proyecto_id)
	end

end
