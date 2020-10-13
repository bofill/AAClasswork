class UsersController < ApplicationController

    def new
        render :new
    end

    def create
        user = User.new(new_user_params)
        if user.save
            login_user!(user)
            redirect_to new_session_url
        else
            render :new
        end
    end

    private

    def new_user_params
        params.require(:user).permit(:user_name, :password)
    end

end