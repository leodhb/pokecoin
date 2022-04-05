class ApplicationController < ActionController::Base
    def current_user
        User.where(
            full_name: "Henrique Barbosa",
            email: 'henrikleod@gmail.com',
            password: "singleteste"
        ).first_or_create
    end
end
