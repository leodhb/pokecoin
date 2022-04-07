module PokemonHelper
    def pokemon_from_logged_user?
        @pokemon.user.id == current_user.id
    end

    def current_user
        User.where(
            full_name: "Henrique Barbosa",
            email: 'henrikleod@gmail.com',
            password: "singleteste"
        ).first_or_create
    end
end
