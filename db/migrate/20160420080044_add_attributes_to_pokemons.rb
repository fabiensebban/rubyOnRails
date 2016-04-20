class AddAttributesToPokemons < ActiveRecord::Migration
  def change
  	add_column :pokemons, :number, :integer
  	add_column :pokemons, :level, :integer
  	add_column :pokemons, :health_points, :integer
  end
end
