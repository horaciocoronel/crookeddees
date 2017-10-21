Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  resources :users, only: [:new, :create]
  resources :sessions, only:[:new, :create, :destroy]
  resources :appointments

  namespace :admin do
    resources :appointments, only: [:index]
  end
end
