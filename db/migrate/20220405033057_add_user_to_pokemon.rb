class AddUserToPokemon < ActiveRecord::Migration[7.0]
  def change
    add_reference :pokemons, :user, foreign_key: true
  end
end
