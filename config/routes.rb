Rails.application.routes.draw do
  root 'songs#index'
  resources :songs
  resources :users
  resources :comments
  resources :sessions, only: [:new, :update]
  delete '/logout' => 'sessions#destroy', as: :logout
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
