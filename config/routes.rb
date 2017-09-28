Rails.application.routes.draw do
  root 'songs#index'
  get 'songs/genre/:id' => 'songs#locate_by_genre', :as => :locate_by_genre
  resources :songs
  resources :users
  resources :comments
  resources :sessions, only: [:new, :create]
  delete '/logout' => 'sessions#destroy', as: :logout
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
