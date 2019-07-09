module Api
    class UsersController < ApplicationController
        protect_from_forgery prepend: true

        def create
            @user = User.new(user_params)
            
            if @user.save
                render json: @user, status: :ok
            else
                render :json => { :errors => @user.errors.full_messages }, status: :unprocessable_entity
            end
        end

        
        private

        def user_params
            params.require(:user).permit(:email, :password, :password_confirmation, :is_admin)
        end
    end
end
