Rails.application.routes.draw do
  root "books#index"

  # resources :books
  #
  # scope :books do
  #   resources :pages
  # end

  resources :books, except: [:index] do
    resources :pages, only: [:index, :new, :create]
  end

  resources :books, except: [:index], shallow: true do
    resources :pages, only: [:show, :edit, :update, :destroy]
  end
end
