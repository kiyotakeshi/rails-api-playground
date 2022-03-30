Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # $ rails routes | grep -v rails

  # $ rails routes -g articles
  # get '/articles', to: 'articles#index'

  # this approach helps create rules for all CRUD operation
  # resources :articles
  resources :articles, only: [:index]
end
