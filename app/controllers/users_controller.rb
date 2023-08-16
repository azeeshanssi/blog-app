class UsersController < ApplicationController
    before_action:user_params,only:[:create]
    def index
        @users=User.all
    end
    def new
        #this will display the user form for creating a user
        @user = User.new
        print("came here")
        
    end
    def create
        print("came here aswell")
        @user=User.new(user_params)
        if @user.save
            redirect_to root_path, notice:('User was created succesfully')
        end

    end



    private
    def user_params
    params.require(:user).permit(:name,:age)
    end
end
