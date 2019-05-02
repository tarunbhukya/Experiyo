Rails.application.routes.draw do
  devise_for :users
  resources :users
  # get 'information_controller/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "information#index"

  # API authentication
  post 'auth_user' => 'authentication#authenticate_user'
end
