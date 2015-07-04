class ProyectosController < ApplicationController

	respond_to :json

	def index

		@proyectos = Proyecto.all

		respond_to do |format|
			format.json { render json: @proyectos }
		end

	end
end
