Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'users#top'
  resources :users, :only =>[:index,:show,:edit,:update,:destroy]
  mount ActionCable.server => '/cable'
  post 'users/:id/review_create' => 'users#review_create', as: "review_create"
end
