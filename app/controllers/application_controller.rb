class ApplicationController < ActionController::Base
    
    respond_to :json

    private

    def current_user
        @current_user = User.find(@current_user_id)
    end

    def signed_in?
        @current_user.present?
    end

    def authenticate_user
        if request.headers['Authorization'].present?
            authenticate_or_request_with_http_token do |token, options|
                begin
                    @current_user_id = User.find_by(authentication_token: token).id
                rescue
                    head :unauthorized
                end
            end
        else
            head :unauthorized
        end
    end
end
