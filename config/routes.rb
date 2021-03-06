Rails.application.routes.draw do
  resources :users
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :questions do
    collection do
      get :solved
      get :unsolved
    end
    member do
      post :solve
    end
    resources :answers, only:[:create, :destroy]
  end

  root to: 'sessions#new'

  namespace :admin do
    resources :users
    resources :questions
    get "/login", to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
