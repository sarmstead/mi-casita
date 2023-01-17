Rails.application.routes.draw do
  root 'pages#home'

  scope '/workshop' do
    devise_for :people, controllers: { registrations: 'devise/people/registrations', sessions: 'devise/people/sessions' }
  end

  scope module: :workshop, path: :workshop do
    resources :people, :houses, :home_ownerships, :windows, :doors
    get '/', to: 'people#dashboard', as: :workshop_dashboard
  end
end
