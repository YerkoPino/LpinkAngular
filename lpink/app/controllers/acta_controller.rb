class ActaController < ApplicationController

	skip_before_action :verify_authenticity_token
	respond_to :json

	# Genera una nueva acta en la base de datos de acuerdo a los parametros recibidos

	def create

	  @acta = Actum.new(acta_params)
	  @acta.save
	    respond_to do |format|
	        format.json {render json: @acta}
	    end
	end


	def ultimaActa
		@acta = Actum.last
		respond_to do |format|
			format.json {render json: @acta}
		end

	end


		def index
			
	    @argumentos = params[:parametro]
	    @Actas = Actum.where( :proyecto_id => @argumentos)

	    respond_to do |format|
	      format.json { render json: @Actas }
	    end

		end

	  def cantidadActas

	    @argumentos = params[:parametro]
	    @Actas = Actum.where( :proyecto_id => @argumentos).count

	    respond_to do |format|
	      format.json { render json: { :cantidad => @Actas}.to_json }
	    end


	  end


	# Parametros privados para crear una nueva acta

	private
	 def acta_params
	   params.require(:acta).permit(:acta_correlativo, :acta_fecha , :acta_inicio , :acta_termino, :proyecto_id)
	 end

end
