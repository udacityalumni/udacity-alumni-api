Rails.application.routes.draw do
  devise_for :users

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :articles, only: [:index, :show, :create, :update, :destroy]
      resources :users, only: [:show, :create, :update], param: :auth_token
      resources :sessions, only: [:create, :destroy], param: :auth_token
    end
  end
end
