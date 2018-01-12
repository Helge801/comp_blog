Rails.application.routes.draw do
  root to: 'blogs#index'
  resources :charges
  resources :blogs
  devise_for :users
  resources :chat_rooms, only: [:new, :create, :show, :index]

  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
