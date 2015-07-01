class DialogicoController < ApplicationController

	skip_before_action :verify_authenticity_token
	respond_to :json


	def index

     # @argumentos = params[:parametro]
     # @dialogicos = ElementoDialogico.where( :actum_id => @argumentos )

     @dialogicos = ElementoDialogico.all

      respond_to do |format|
        format.json { render json: @dialogicos }
      end

    end


    def create
    end


    private
     def dialogico_params
     	
     end

end
