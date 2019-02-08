# == Route Map
#
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#              ratings_home GET    /ratings/home(.:format)                                                                  ratings#home
#                lists_home GET    /lists/home(.:format)                                                                    lists#home
#                      root GET    /                                                                                        users#index
#                     users GET    /users(.:format)                                                                         users#index
#                           POST   /users(.:format)                                                                         users#create
#                  new_user GET    /users/new(.:format)                                                                     users#new
#                     login GET    /login(.:format)                                                                         session#new
#                           POST   /login(.:format)                                                                         session#create
#                           DELETE /login(.:format)                                                                         session#destroy
#                 directors GET    /directors(.:format)                                                                     directors#index
#                           POST   /directors(.:format)                                                                     directors#create
#              new_director GET    /directors/new(.:format)                                                                 directors#new
#             edit_director GET    /directors/:id/edit(.:format)                                                            directors#edit
#                  director GET    /directors/:id(.:format)                                                                 directors#show
#                           PATCH  /directors/:id(.:format)                                                                 directors#update
#                           PUT    /directors/:id(.:format)                                                                 directors#update
#                           DELETE /directors/:id(.:format)                                                                 directors#destroy
#                     films GET    /films(.:format)                                                                         films#index
#                           POST   /films(.:format)                                                                         films#create
#                  new_film GET    /films/new(.:format)                                                                     films#new
#                 edit_film GET    /films/:id/edit(.:format)                                                                films#edit
#                      film GET    /films/:id(.:format)                                                                     films#show
#                           PATCH  /films/:id(.:format)                                                                     films#update
#                           PUT    /films/:id(.:format)                                                                     films#update
#                           DELETE /films/:id(.:format)                                                                     films#destroy
#                   ratings GET    /ratings(.:format)                                                                       ratings#index
#                           POST   /ratings(.:format)                                                                       ratings#create
#                new_rating GET    /ratings/new(.:format)                                                                   ratings#new
#               edit_rating GET    /ratings/:id/edit(.:format)                                                              ratings#edit
#                    rating GET    /ratings/:id(.:format)                                                                   ratings#show
#                           PATCH  /ratings/:id(.:format)                                                                   ratings#update
#                           PUT    /ratings/:id(.:format)                                                                   ratings#update
#                           DELETE /ratings/:id(.:format)                                                                   ratings#destroy
#                    search GET    /search(.:format)                                                                        films#search_form
#            search_results GET    /search/results(.:format)                                                                films#search_results
#                           GET    /movies/:id(.:format)                                                                    films#show_search
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do

  root :to => 'session#new'
  resources :users, :only => [:new, :create, :index]

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :directors
  resources :films do
  resources :ratings
  end
  get "/search" => "films#search_form"

  get "/search/results" => "films#search_results"
  get "/movies/:id" => "films#show_search"

  
end
