#app/controllers/pokemons_controller.rb

class PokemonsController < ApplicationController
#filtre qui s'execute à chaque début d'actionpour les actions spécifiés dans le only
	before_action :set_pokemon, only: [:show, :edit, :update, :destroy]
	before_action :check_minimum
	before_action :authenticate_user!, only: [:new, :create]

	def index 
		@pokemons = Pokemon.paginate(page: params[:page], per_page: 1)
						   .includes(:type)
	end

	def show
	end

	def new
		@pokemon = Pokemon.new
	end

	def create
		@pokemon = Pokemon.new pokemon_params
		if @pokemon.save
			redirect_to @pokemon
		else
			render 'new'
		end
	end

	def edit 
	end

	def update
		if @pokemon.update pokemon_params
			flash[:success] = "Le Pokemon #{@pokemon.name} a bien été mis à jour"
			redirect_to @pokemon
		else
			render 'edit'
		end
	end

	def destroy
		@pokemon.destroy
		redirect_to pokemons_path
	end

	private 

	def pokemon_params
		params.require(:pokemon).permit(
			:name,
			:level,
			:number,
			:health_points,
			:type_id,
			move_ids: [])
	end

	def set_pokemon
		@pokemon = Pokemon.find params[:id]
	end

	def check_minimum
		count = Pokemon.count
		limit = 10
		flash[:danger] = "Vorte Pokedex contient moins de #{limit} Pokemons" if count < limit
	end
end 