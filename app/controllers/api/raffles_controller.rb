module Api
    class RafflesController < ApplicationController
        protect_from_forgery prepend: true

        before_action :authenticate_user

        def create
            @raffle = Raffle.new(raffle_params)

            @raffle.created_by = current_user.id

            if @raffle.save
                render json: @raffle, status: :ok
            else 
                render :json => { :errors => @raffle.errors.full_messages }, status: :unprocessable_entity
            end

        end

        
        private

        def raffle_params
            params.require(:raffle).permit(:name, :description)
        end
    end
end
