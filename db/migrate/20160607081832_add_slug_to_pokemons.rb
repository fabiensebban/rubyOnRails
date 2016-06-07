class AddSlugToPokemons < ActiveRecord::Migration
  def change
    add_column :pokemons, :slug, :string, unique: true, index: true
  end
end
