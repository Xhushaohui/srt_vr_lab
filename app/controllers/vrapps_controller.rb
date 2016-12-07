class VrappsController < ApplicationController

	before_action :find_vrapp, only: [:show, :edit, :update, :destroy]
	before_action :find_vrscene, only: [:show]

	def index
		@vrapps = Vrapp.all.order("created_at DESC")
	end

	def new
		@vrapp = Vrapp.new
	end

	def create
		@vrapp =  Vrapp.new vrapp_params
		if @vrapp.save
			redirect_to @vrapp, notice: "Successfully saved!"
		else
			render 'new', notice: "Unable to save your App!"
		end
	end

	def show
		
	end

	def edit
		
	end

	def update
		if @vrapp.update vrapp_params
			redirect_to @vrapp, notice: "Successfully saved!"
		else
			render 'edit'
		end
	end

	def destroy
		@vrapp.destroy
		redirect_to vrapps_path
	end

private

	def vrapp_params
		params.require(:vrapp).permit(:name, :description, :tag, :scenecount, :thumbnail)
	end
	def find_vrscene
		@vrscenes = Vrscene.where(vrapp_id: @vrapp).order("created_at DESC")
	end
	def find_vrapp
		if params[:id].nil?
			
		else
			@vrapp = Vrapp.find(params[:id])
		end
	end

end
