Rails.application.routes.draw do
  resources :people do
    resources :houses
    resources :home_ownerships
  end
end
