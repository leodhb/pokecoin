class AddUserAndPokemonToTransaction < ActiveRecord::Migration[7.0]
  def change
    add_reference :transactions, :user, foreign_key: true
    add_reference :transactions, :pokemon, foreign_key: true
  end
end
