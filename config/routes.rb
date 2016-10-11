Rails.application.routes.draw do
  devise_for :users

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :articles, only: [:index, :show, :create, :update, :destroy]
      resources :tags, only: [:index, :show, :create, :update, :destroy]
      resource :users, only: [:show, :create, :update]
      resource :sessions, only: [:create, :destroy]
    end
  end
end
