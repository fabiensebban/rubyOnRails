#app/models/pokemon.rb

class Pokemon < ActiveRecord::Base 
	belongs_to :type
end