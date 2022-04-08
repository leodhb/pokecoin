class HomeController < ApplicationController
  def index
    @pokemons = Pokemon.last(8)
  end
end
