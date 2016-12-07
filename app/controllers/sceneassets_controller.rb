class SceneassetsController < ApplicationController

	before_action :find_vrapp
	before_action :find_vrscene
	before_action :find_sceneasset, only: [:show, :edit, :update, :destroy]

	def new
		@sceneasset = @vrscene.sceneassets.new
	end

	def create
		@sceneasset = @vrscene.sceneassets.new sceneasset_params
		if @sceneasset.save
			redirect_to vrapp_vrscene_sceneasset_path(@vrapp, @vrscene, @sceneasset)
		else
			render 'new'
		end
	end

	def show
		
	end

	def edit
		
	end

	def update
		if @sceneasset.update sceneasset_params
			redirect_to vrapp_vrscene_sceneasset_path(@vrapp, @vrscene, @sceneasset), notice: "Successfully saved!"
		else
			render 'edit'
		end
	end

	def destroy
		@sceneasset.destroy
		redirect_to vrapp_vrscene_path(@vrapp, @vrscene)
	end
	private

	def sceneasset_params
		params.require(:sceneasset).permit(:assetname, :location, :text)
	end

	def find_vrapp
		@vrapp = Vrapp.find(params[:vrapp_id])
	end
	def find_vrscene
		@vrscene = Vrscene.find(params[:vrscene_id])
	end
	def find_sceneasset
		@sceneasset = Sceneasset.find(params[:id])
	end
end
