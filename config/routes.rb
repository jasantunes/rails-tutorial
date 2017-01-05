Rails.application.routes.draw do

  # Static Pages controller.  
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  
  # Users controller.  
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  # Sessions controller.  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  # Adds all the actions needed for a RESTful Users resource:
  # GET, POST, PATCH, and UPDATE to /users, /users/new, /users/<id>, /users/<id>/edit, etc.
  resources :users 
end
