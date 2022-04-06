class PokemonController < ApplicationController
  before_action :fetch_pokemon, only: [:show, :checkout, :sell, :buy]

  def index
    @pokemons = Pokemon.all
  end

  def show; end

  def checkout
    redirect_to pokemon_show_path(params[:id]) if pokemon_from_logged_user?
    @price_in_usd, @btc_price = btc_to_usd(@pokemon.price)
  end

  def buy
    redirect_to pokemon_show_path(params[:id]) if pokemon_from_logged_user?

    @price_in_usd, @btc_price = btc_to_usd(@pokemon.price)
    handle_insufficient_amount if current_user.balance < @price_in_usd


    #transaction
    handle_transaction(Transaction::OPERATIONS[:buy])

    #do a flash success here later
    redirect_to root_path
  end
  
  def sell
  end

  def fetch_pokemon
    @pokemon = Pokemon.find(params[:id])
  end

  def handle_transaction(operation)
    @price_in_usd = -@price_in_usd if operation == Transaction::OPERATIONS[:buy]

    user_id = current_user.id if operation == Transaction::OPERATIONS[:buy] else 1

    User.transaction do
      @user = User.find(current_user.id)
      @user.update(balance: @user.balance + @price_in_usd)
      @pokemon.update(user_id: @user.id, last_sell_price: @price_in_usd)

      Transaction.new(
        action: operation[:action],
        user_id: @user.id,
        pokemon_id: @pokemon.id
      ).save!
    end
  end

  def handle_insufficient_amount
    flash[:error] = "You don't have USD #{@price_in_usd} to buy this."
    redirect_to pokemon_checkout_path
  end

  def btc_to_usd(pokemon_price)
    url = "https://api.blockchain.com/v3/exchange/tickers/BTC-USD"

    btc_price = JSON.parse(RestClient.get(url))['price_24h'].to_f

    [
      (btc_price * pokemon_price).round(2),
      btc_price
    ]
  end
end
