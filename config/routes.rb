Rails.application.routes.draw do
  resources :events do
    resources :event_exceptions, only: [:create, :destroy]
  end
  root to: 'visitors#index'
  devise_for :users
end
