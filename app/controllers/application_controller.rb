class ApplicationController < ActionController::Base
    add_flash_types :info, :error, :warning

    def current_user
        User.where(
            full_name: "Henrique Barbosa",
            email: 'henrikleod@gmail.com',
            password: "singleteste"
        ).first_or_create
    end
end
