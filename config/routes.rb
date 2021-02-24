Rails.application.routes.draw do
  root "home#index"
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  resources :users
  resources :events
end
