class PokemonController < ApplicationController

  def index
    @pokemons = Pokemon.all
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def checkout
    @pokemon = Pokemon.find(params[:id])
    @price_in_usd, @btc_price = btc_to_usd(@pokemon.price)

    redirect_to pokemon_show_path if pokemon_from_logged_user?(@pokemon) 
  end

  def buy
  end
  
  def sell
  end

  def btc_to_usd(pokemon_price)
    url = "https://api.blockchain.com/v3/exchange/tickers/BTC-USD"

    btc_price = JSON.parse(RestClient.get(url))['price_24h'].to_f

    [
      btc_price * pokemon_price,
      btc_price
    ]
  end

  def pokemon_from_logged_user?(pokemon)
    pokemon.user == current_user
  end
end
