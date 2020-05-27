# == Route Map
#
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#                       erd        /erd                                                                                     Erd::Engine
#                      root GET    /                                                                                        pages#index
#               new_session GET    /sessions/new(.:format)                                                                  sessions#new
#                  sessions POST   /sessions(.:format)                                                                      sessions#create
#                           DELETE /sessions(.:format)                                                                      sessions#destroy
#                  new_user GET    /users/new(.:format)                                                                     users#new
#                     users POST   /users(.:format)                                                                         users#create
#                      user GET    /users/:id(.:format)                                                                     users#show
#             user_expenses GET    /users/:id/expenses(.:format)                                                            expenses#index
#          new_user_expense GET    /users/:id/expenses/new(.:format)                                                        expenses#new
#                  expenses POST   /expenses(.:format)                                                                      expenses#create
#                    groups GET    /groups(.:format)                                                                        groups#index
#                           POST   /groups(.:format)                                                                        groups#create
#                 new_group GET    /groups/new(.:format)                                                                    groups#new
#                     group GET    /groups/:id(.:format)                                                                    groups#show
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create
#
# Routes for Erd::Engine:
#         GET  /                  erd/erd#index
#         PUT  /                  erd/erd#update
# migrate PUT  /migrate(.:format) erd/erd#migrate
#    root GET  /                  erd/erd#index

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'

  get '/sessions/new', to: 'sessions#new', as: 'new_session'
  post '/sessions', to: 'sessions#create'
  delete '/sessions', to: 'sessions#destroy'

  get '/users/new', to: 'users#new', as: 'new_user'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'

  get '/users/:id/expenses', to: 'expenses#index', as: 'user_expenses'
  get '/users/:id/expenses/new', to: 'expenses#new', as: 'new_user_expense'
  post '/expenses', to: 'expenses#create'

  resources :groups, only: %i[index new create]
  get '/group/:group_id/expenses', to: 'expenses#index', as: 'group'
end
