module Api
    class UsersController < ApplicationController
        protect_from_forgery prepend: true

        before_action :authenticate_user, only: [:show]

        def show 
            @user = User.find(params[:id])
            @raffles = params[:raffles] ? @user.raffles : nil

            render :show, status: :ok
        end

        def create
            @user = User.new(user_params)
            
            if @user.save
                render :create, status: :ok
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
