Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :users, only: [:create, :show]
    resource :sessions, only: [:create, :destroy]
    resources :raffles, only: [:create, :show, :destroy, :index, :update]
  end
end
