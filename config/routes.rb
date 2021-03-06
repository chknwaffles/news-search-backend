Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles, only: [:index]
  resources :users, only: [:index, :create, :show]
  
  post "/login", to: "auth#login"
  get "/auto_login", to: "auth#auto_login"
  get '/articles/search/:topic', to: 'articles#search'
  get '/like/:id/article/:article_id', to: 'users#favorite'
  get '/article/:id/like', to: 'articles#like'
  get '/article/:id/dislike', to: 'articles#dislike'
  get '/articles/most_liked', to: 'articles#most_liked'
end
