Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'users#top'
  resources :users, :only =>[:index,:show,:edit,:update,:destroy]
  mount ActionCable.server => '/cable'
  post 'users/:id/review_create' => 'users#review_create', as: "review_create"
  post 'users/:id/inquiry_create' => 'users#inquiry_create', as: "inquiry_create"
  get 'users/:id/inquiry_show/:inquiry_id' => 'users#inquiry_show', as: "inquiry_show"
  resources :inquiry, :only => [:destroy]
  delete 'users/:id/inquiry_show/:inquiry_id' => 'users#inquiry_destroy', as: "inquiry_destroy"
end
