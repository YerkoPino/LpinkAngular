class TemaController < ApplicationController

	skip_before_action :verify_authenticity_token
	respond_to :json

	def create
	end

	private
	 def tema_params

	 end


end
