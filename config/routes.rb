Rails.application.routes.draw do
  resources :articles, defaults: { format: 'json' }

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
