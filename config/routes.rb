Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :users, only: [:create] do
      resource :raffle_contestant, only: [:show]
    end
    resource :sessions, only: [:create, :destroy]
    resources :raffles, only: [:create, :show, :destroy, :index]
  end
end
