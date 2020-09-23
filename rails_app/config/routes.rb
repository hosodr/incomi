Rails.application.routes.draw do
  post 'events/:id/participate/:user_id', to: 'events#participate'
  resources :events
  resources :comments
  resources :channels
  resources :users
  resources :hellos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
