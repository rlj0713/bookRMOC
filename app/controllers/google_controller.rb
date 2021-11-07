class GoogleController < ApplicationController

    def create
        @user = User.find_or_create_by(username: auth['info']['email']) do |u|
            u.name = auth['info']['name']
            u.password = auth['uid'][-5...-1]
            u.email = auth['info']['email']
            u.image = auth['info']['image']
        end

        @user.save
        session[:user_id] = @user.id
        session[:school_id] = @user.school_id
    end

    def new
        render :new
    end
        
    private

    def auth
        request.env['omniauth.auth']
    end
end