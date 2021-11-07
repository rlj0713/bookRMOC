class SessionsController < ApplicationController

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to @user
        else
            @error = 'username and password do not match our system'
            render :new
        end
    end

    def new
        @user = User.find_by_id(session[:user_id])
        if session[:user_id]
            redirect_to @user
        end
    end

    def destroy
        session.delete('user_id')
        redirect_to root_path
    end

end