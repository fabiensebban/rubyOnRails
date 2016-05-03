class CreatePokemonMoves < ActiveRecord::Migration
  def change
    create_table :pokemon_moves do |t|
      t.references :pokemon, index: true, foreign_key: true
      t.references :move, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
