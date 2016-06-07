#app/controllers/pokemons_controller.rb

class PokemonsController < ApplicationController
#filtre qui s'execute à chaque début d'actionpour les actions spécifiés dans le only
	load_and_authorize_resource

	before_action :check_minimum
	before_action :authenticate_user!, only: [:new, :create]

	def index 
		@pokemons = Pokemon.paginate(page: params[:page], per_page: 4)
						   .includes(:type)
		if params[:pokemons]
			@search_value = search_params[:search]
			@pokemons = @pokemons.search(@search_value)
		end
	end

	def show
	end

	def new
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
			:avatar,
			move_ids: [])
	end

	def check_minimum
		count = Pokemon.count
		limit = 10
		flash[:danger] = "Vorte Pokedex contient moins de #{limit} Pokemons" if count < limit
	end

	def search_params
		params.require(:pokemons).permit(:search)
	end

end 