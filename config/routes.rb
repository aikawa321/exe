Rails.application.routes.draw do
  get 'stars/new'
  get 'stars/create'
  devise_for :users
  root to: 'users#top'
  get 'users/area_search' => 'users#area_search', as: :area_search
  resources :users, :only =>[:index,:show,:edit,:update,:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
  post 'users/:id/review_create' => 'users#review_create', as: "review_create"
end
