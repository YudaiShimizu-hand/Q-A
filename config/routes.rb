Rails.application.routes.draw do
  resources :users
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  namespace :admin do
    resources :users
  end
  resources :questions
  root to: 'sessions#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
