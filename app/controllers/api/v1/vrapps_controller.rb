class Api::V1::VrappsController < Api::V1::BaseController

	respond_to :json
	before_action :find_vrapp, only: [:show, :edit, :update, :destroy]

	def show
		respond_with @vrapp
	end

	def index
		respond_with Vrapp.all.order("created_at DESC")
	end

	def new
		@vrapp = Vrapp.new
	end

	def create
		@vrapp =  Vrapp.new vrapp_params
		# @vrapp.name  = params[:name]
		# @vrapp.description = params[:description]

		if @vrapp.save
			render json: @vrapp, status: 201, location: [:api_v1, @vrapp]
		else
			render json: { errors: @vrapp.errors }, status: 422	
		end
	end

private

	def vrapp_params
		# params.require(:vrapp).permit(:name)
		 params.require(:vrapp).permit(:name, :description, :tag, :scenecount, :thumbnail)
	end

	def find_vrapp
		if params[:id].nil?
			
		else
			@vrapp = Vrapp.find(params[:id])
		end
	end

end
