Rails.application.routes.draw do
  root 'pages#home'

  resources :people
  resources :houses
  resources :home_ownerships
  resources :windows
  resources :doors
end
