class AddTypeToPokemon < ActiveRecord::Migration
  def change
    add_reference :pokemons, :type, index: true, foreign_key: true
  end
end
