class ApplicationController < ActionController::Base
    add_flash_types :info, :error, :warning

    def current_user
        User.where(
            full_name: "Henrique Barbosa",
            email: 'henrikleod@gmail.com',
            password: "singleteste"
        ).first_or_create
    end

    def exchange_user
        User.where(
            full_name: "PokéCoin Exchange",
            email: 'pokecoin@example.com',
            password: "whatapass"
        ).first_or_create
    end

    def pokemon_from_logged_user?
        @pokemon.user.id == current_user.id
    end
end
