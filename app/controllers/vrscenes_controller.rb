class VrscenesController < ApplicationController

	before_action :find_vrapp
	before_action :find_vrscene, only: [:show, :edit, :update, :destroy]

	def new
		@vrscene = @vrapp.vrscenes.new
		
	end
	def create
		@vrscene = @vrapp.vrscenes.new vrscene_params
		if @vrscene.save
			redirect_to vrapp_vrscene_path(@vrapp, @vrscene)
		else
			render 'new'
		end
	end

	def show
		@sceneassets = Sceneasset.where(vrscene_id: @vrscene).order("created_at DESC")
	end

	def edit
		
	end

	def update
		if @vrscene.update vrscene_params
			redirect_to vrapp_vrscene_path(@vrapp, @vrscene), notice: "Successfully saved!"
		else
			render 'edit'
		end
	end
	def destroy
		@vrscene.destroy
		redirect_to vrapp_path(@vrapp)
	end

	private

	def vrscene_params
		params.require(:vrscene).permit(:scenename, :orderid, :scenetype, :scene_img)
	end

	def find_vrapp
		@vrapp = Vrapp.find(params[:vrapp_id])
	end
	def find_vrscene
		@vrscene = Vrscene.find(params[:id])
	end
end
