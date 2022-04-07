module PokemonHelper
    def pokemon_from_logged_user?
        @pokemon.user.id == current_user.id
    end
end
