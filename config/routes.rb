Rails.application.routes.draw do
  root 'pages#home'

  scope '/workshop' do
    devise_for :people, controllers: { registrations: 'devise/people/registrations' }
    resources :people, :houses, :home_ownerships, :windows, :doors
  end
end
