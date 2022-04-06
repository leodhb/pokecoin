class AddLastSellPriceToPokemon < ActiveRecord::Migration[7.0]
  def change
    add_column :pokemons, :last_sell_price, :decimal, precision: 15, scale: 2
  end
end
