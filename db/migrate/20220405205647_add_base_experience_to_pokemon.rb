class AddBaseExperienceToPokemon < ActiveRecord::Migration[7.0]
  def change
    add_column :pokemons, :base_experience, :integer
  end
end
