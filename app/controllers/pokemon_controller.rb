class PokemonController < ApplicationController
  before_action :authenticate_user!, only: [:checkout, :buy, :sell]
  before_action :fetch_pokemon, only: [:show, :checkout, :sell, :buy]
  before_action :fetch_bitcoin_price, only: [:show, :checkout, :buy, :sell]

  def index
    @pokemons = Pokemon.where(user_id: exchange_user.id).all
  end

  def show; end

  def checkout; end

  def buy
    handle_insufficient_amount if current_user.balance < @price_in_usd

    redirect_to pokemon_show_path if pokemon_from_logged_user?

    handle_transaction(Transaction::OPERATIONS[:buy])

    #do a flash success here later
    redirect_to root_path
  end
  
  def sell
    redirect_to pokemon_show_path unless pokemon_from_logged_user?
    
    handle_transaction(Transaction::OPERATIONS[:sell])

    #do a flash success here later
    redirect_to root_path
  end

  def handle_transaction(operation)
    buyer_id = exchange_user.id

    if Transaction::OPERATIONS[:buy].equal?(operation)
      @price_in_usd = -@price_in_usd
      buyer_id = current_user.id
    end

    User.transaction do
      @user = User.find(current_user.id)
      @user.update(balance: @user.balance + @price_in_usd)
      @pokemon.update(user_id: buyer_id, last_sell_price: @price_in_usd)

      Transaction.new(
        action: operation[:action],
        user_id: current_user.id,
        pokemon_id: @pokemon.id,
        amount: @price_in_usd
      ).save!
    end
  end

  def handle_insufficient_amount
    flash[:error] = "You don't have USD #{@price_in_usd} to buy this."
    redirect_to pokemon_checkout_path
  end

  def fetch_pokemon
    @pokemon = Pokemon.find(params[:id])
  end

  def fetch_bitcoin_price
    @price_in_usd, @btc_price = TickerService.new(pokemon_price: @pokemon.price).call
  end
end
