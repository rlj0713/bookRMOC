Rails.application.routes.draw do
  get '/auth/:provider/callback' => 'google#create'
  
  post '/sessions' => 'sessions#create'
  delete '/sessions' => 'sessions#destroy'

  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end
end
