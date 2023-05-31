Rails.application.routes.draw do
  root "books#index"

  resources :pages
  resources :books
end
