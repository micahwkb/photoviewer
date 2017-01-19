Rails.application.routes.draw do

  root 'home#index'

  # --- SESSIONS ---
  get '/login' => 'sessions#new', as: :login
  get '/auth/500px/callback' => 'sessions#create'
  get '/auth/failure' => 'sessions#failure'

end
