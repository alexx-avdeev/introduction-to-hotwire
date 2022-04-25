Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'

  resource :eager_loading, only: [:show] do
    get :show_data
  end

  resources :quotes
end
