Rails.application.routes.draw do

  root 'sessions#new' # => root_path
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get 'users/new'

  get 'tasks/index'
  post 'tasks/create'
  get 'tasks/show'
  get 'tasks/edit'
  patch 'tasks/update'
  get  '/signup',  to: 'users#new'
  resources :users
  resources :tasks


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
