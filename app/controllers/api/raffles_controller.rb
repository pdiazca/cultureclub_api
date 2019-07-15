module Api
    class RafflesController < ApplicationController
        protect_from_forgery prepend: true

        before_action :authenticate_user

        def index
            @raffles = Raffle.all
            render :index, status: :ok
        end

        def show
            @raffle = Raffle.find(params[:id])
            @users = params[:users] ? @raffle.users : nil

            render :show, status: :ok
        end

        def create
            @raffle = Raffle.new(raffle_params)

            @raffle.created_by = current_user.id

            if @raffle.save
                render :create, status: :ok
            else 
                render :json => { :errors => @raffle.errors.full_messages }, status: :unprocessable_entity
            end
        end

        def update
            @raffle = Raffle.find(params[:id])

            if params[:user_email]
                add_user_to_raffle(params[:user_email], @raffle)
            elsif params[:winner]
                add_winner_to_raffle(@raffle)
            else
                if @raffle.update_attributes(raffle_params)
                    render :update, status: :ok
                else 
                    render :json => { :errors => @raffle.errors.full_messages }, status: :unprocessable_entity
                end
            end
        end

        def add_winner_to_raffle(raffle)
            if raffle.winner.nil?
                raffle.winner = raffle.users.pluck(:id).sample

                if raffle.save
                    render :update, status: :ok
                else
                    render :json => { :errors => @raffle.errors.full_messages }, status: :unprocessable_entity
                end
            else 
                render :json => { :errors => "Winner has already been set" }, status: :unprocessable_entity
            end
        end

        def add_user_to_raffle(user, raffle)
            @user = User.find_by(email: user)

            if raffle.users << @user
                render :update, status: :ok
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
