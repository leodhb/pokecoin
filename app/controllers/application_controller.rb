class ApplicationController < ActionController::Base
    add_flash_types :info, :error, :warning

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

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:full_name, :email, :password)}
    end
end
