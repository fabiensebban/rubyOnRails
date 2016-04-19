#app/controllers/pokemons_controller.rb

class PokemonsController < ApplicationController
	def index 
		@pokemons = Pokemon.all
	end

	def show
		@pokemon = Pokemon.find params[:id]
	end
end 