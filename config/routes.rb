Rails.application.routes.draw do
  root 'pages#home'

  scope '/workshop' do
    devise_for :people, controllers: { registrations: 'devise/people/registrations' }
  end

  scope module: :workshop, path: :workshop do
    resources :people, :houses, :home_ownerships, :windows, :doors
  end
end
