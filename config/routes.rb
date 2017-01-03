Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  
  # Adds all the actions needed for a RESTful Users resource:
  # GET, POST, PATCH, and UPDATE to /users, /users/new, /users/<id>, /users/<id>/edit, etc.
  resources :users 
end
