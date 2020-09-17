Rails.application.routes.draw do
  resources :events
  resources :channels
  resources :comments
  resources :users
  resources :hellos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
