Rails.application.routes.draw do
  root "events#index"
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  resources :users, only: [:new, :create, :show]
  resources :events do
    resources :attendences, only: [:create]
  end
end
