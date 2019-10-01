Rails.application.routes.draw do
  get 'daily_balances/show'
  # static_pages
  get "/home",  to: "static_pages#home"
  get "/help",  to: "static_pages#help"
  get "/about", to: "static_pages#about"
  root "static_pages#home"

  # users
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/users/:id/settings", to: "users#settings_edit", as: "settings_edit"
  patch "/users/:id/settings", to: "users#settings_update", as: "settings_update"
  get "/users/:id/settings/images", to: "users#images_edit", as: "images_edit"
  patch "/users/:id/settings/images", to: "users#images_update", as: "images_update"
  post "/users/:id/settings/images", to: "users#images_reset", as: "images_reset"
  resources :users, only: [:new, :create, :show, :destroy]
  resources :users do
    resources :daily_balances, only: [:show]
  end

  # book_records
  resources :book_records, only: [:create, :destroy]

  # sessions
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
