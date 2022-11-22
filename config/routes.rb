Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get 'profile', to: 'pages#profile'

  resources :rockets do
    resources :reservations, only: %i[new create destroy show]
    member do
      get :accept
    end
  end
end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
