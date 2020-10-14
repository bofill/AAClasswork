class SessionsController < ApplicationController

    def new
        render :new
    end
    #gets the params from the form and checks them against the db
    def create
        user = User.find_by_credentials(
            params[:user][:email],
            params[:user][:password]
        )

        if user
            log_in_user!(user)
            redirect_to users_url
        else
            render :new
            #error message
        end
    end

    def destroy
        log_out_user!
        render :new
    end
        
end

#     session POST   /session(.:format)              sessions#create
#             DELETE /session(.:format)              sessions#destroy
# new_session GET    /session/new(.:format)          sessions#new

#       users POST   /users(.:format)                    users#create
#    new_user GET    /users/new(.:format)                users#new
#        user GET    /users/:id(.:format)                users#show