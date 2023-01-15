Rails.application.routes.draw do
  root 'pages#home'

  scope '/workshop' do
    devise_for :people
    resources :people, :houses, :home_ownerships, :windows, :doors
  end
end
