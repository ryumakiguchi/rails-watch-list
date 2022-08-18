Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :lists, except: %i[edit update destroy] do
    resources :bookmarks, only: %i[new create delete]
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
