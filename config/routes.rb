Rails.application.routes.draw do
  devise_for :users
  resources :groups, except: [:show, :delete]
  root 'messages#index'
end
