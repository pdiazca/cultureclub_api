module Api
    class SessionsController < ApplicationController
        protect_from_forgery prepend: true

        acts_as_token_authentication_handler_for User, only: [:destroy], fallback_to_devise: false

        before_action :authenticate_user, only: [:destroy]

        def create
            @user  = User.find_by_email(params[:email])

            if @user.valid_password?(params[:password])
                render :create, status: :ok
                # render :json => {
                #     email: @user.email, 
                #     authentication_token: @user.authentication_token, 
                #     is_admin: @user.is_admin}, status: :ok
            else
                head(:unauthorized)
            end
        end

        def destroy
            if current_user&.update_attributes(:authentication_token => nil)
                head :ok
            else
                render :json => { :errors => @user.errors.full_messages }, status: 	:unprocessable_entity
            end
        end

        private

        def user_params
            params.require(:user).permit(:email, :password)
        end
    end
end
