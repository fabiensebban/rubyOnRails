class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.string :name
      t.string :description
      t.references :type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
