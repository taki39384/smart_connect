Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to: 'tasks#index'
  resources :goals, only: [:create] 
  resources :tasks do
    collection do
      get 'search'
    end
  end
end
