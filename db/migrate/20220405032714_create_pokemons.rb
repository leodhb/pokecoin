class CreatePokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :image
      t.integer :height
      t.integer :weight
      t.decimal :price, precision: 15, scale: 8

      t.timestamps
    end
  end
end
