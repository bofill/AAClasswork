class SessionsController < ApplicationController

    def new
        render :new
    end

    def create
        # debugger
        user_name = params[:user][:user_name]
        password = params[:user][:password]
        # debugger
        user = User.find_by_credentials(user_name, password)
        session[:session_token] = user.reset_session_token!
        redirect_to cats_url
    end

    def destroy
        current_user.reset_session_token if logged_in?
        session[session_token] = nil
        render :new
    end
end