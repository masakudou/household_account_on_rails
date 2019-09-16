Rails.application.routes.draw do
  # static_pages
  get "/home",  to: "static_pages#home"
  get "/help",  to: "static_pages#help"
  get "/about", to: "static_pages#about"
  root "static_pages#home"

  # users
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  resources :users

  # sessions
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
