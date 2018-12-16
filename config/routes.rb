Rails.application.routes.draw do
  devise_for :users
  root to: 'users#top'
  get 'users/area_search' => 'users#area_search', as: :area_search
  resources :users, :only =>[:index,:show,:edit,:update,:destroy]
  resources :images, only: [:new, :create, :index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
end
