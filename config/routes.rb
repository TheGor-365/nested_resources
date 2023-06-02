Rails.application.routes.draw do
  root "web/books#index"

  # resources :books
  #
  # scope :books do
  #   resources :pages
  # end

  scope module: :web do
    resources :books, except: %i[index] do
      resources :pages, only: %i[index new create]
    end

    resources :books, except: %i[index], shallow: true do
      resources :pages, only: %i[show edit update destroy]
    end
  end
end
