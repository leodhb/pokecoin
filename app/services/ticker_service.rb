class TickerService
    BASE_URL = "https://api.blockchain.com/v3/exchange/tickers/"

    def initialize(currency_pair: 'BTC-USD', pokemon_price:)
        @currency_pair = currency_pair
        @pokemon_price = pokemon_price
    end

    def call
        btc_price = JSON.parse(RestClient.get("#{BASE_URL}#{@currency_pair}"))['price_24h'].to_f

        [
            (btc_price * @pokemon_price).round(2),
            btc_price
        ]
    end
end
