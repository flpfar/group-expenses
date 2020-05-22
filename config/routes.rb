Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#new'

  get '/sessions/new', to: 'sessions#new', as: 'new_session'
  post '/sessions', to: 'sessions#create'

  get '/users/new', to: 'users#new', as: 'new_user'
  post '/users', to: 'users#create'

  # resources :users

  # get '/friendships/:id', to: 'friendships#create', as: 'new_friendship'
  # put '/friendships/:id', to: 'friendships#update', as: 'friendship'

  
end
