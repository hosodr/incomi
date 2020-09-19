Rails.application.routes.draw do
  resources :events
  post 'events/:id/participate', to: 'events#participate'
  
  resources :comments
  resources :channels
  resources :users
  resources :hellos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
