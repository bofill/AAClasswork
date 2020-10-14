class UsersController < ApplicationController
    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            log_in_user!(@user)
            redirect_to user_url
        else
            render :new
        end
    end

    def show
        @user = User.find_by(params[:id])
        render :show    
    end

    private
    def user_params
        params.require(:user).permit(:email, :password)
    end
end

#     session POST   /session(.:format)              sessions#create
#             DELETE /session(.:format)              sessions#destroy
# new_session GET    /session/new(.:format)          sessions#new

#       users POST   /users(.:format)                    users#create
#    new_user GET    /users/new(.:format)                users#new
#        user GET    /users/:id(.:format)                users#show