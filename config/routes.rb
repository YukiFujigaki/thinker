Rails.application.routes.draw do
  devise_for :users
  get 'pages/index'
  get 'pages/show'

  get '/role_models', to: 'role_models#index'
  get '/role_models/new', to: 'role_models#new'
  post '/role_models/create', to: 'role_models#create'
  get '/role_models/show/:id', to: 'role_models#show'
  get '/role_models/edit/:id', to: 'role_models#edit'
  patch '/role_models/update/:id', to: 'role_models#update'

  get '/tags/autocomplete_tag/all_tags', to: 'tags#all_tags'
  get '/tags/autocomplete_tag/:tag', to: 'tags#autocomplete_tag'
end
