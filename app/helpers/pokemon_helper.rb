module PokemonHelper
    def pokemon_from_logged_user?
        return false if current_user.nil?
            
        @pokemon.user.id == current_user.id
    end
end
