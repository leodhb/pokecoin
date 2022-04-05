class User < ApplicationRecord
    has_many :pokemons, dependent: :destroy
end
