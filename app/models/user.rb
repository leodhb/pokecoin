class User < ApplicationRecord
    has_many :pokemons, dependent: :destroy
    has_many :transactions, dependent: :destroy
end
