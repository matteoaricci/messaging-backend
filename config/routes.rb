Rails.application.routes.draw do
  resources :private_messages
  resources :messages
  resources :rooms
  resources :users

  post '/login', to: 'auth#create'
  get '/room_messages/:id', to: 'rooms#room_messages'
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
