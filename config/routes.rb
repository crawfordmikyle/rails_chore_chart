Rails.application.routes.draw do
  devise_for :users
  root to: "static_pages#index"
  get 'user/:id' => 'users#show', as: :user_show
  resources :teams, :only => [:new, :edit, :show, :destroy]
  resources :friendships, :only => [:new, :edit, :show, :destroy]
  resources :chores, :only => [:new, :edit, :show, :destroy]
  resources :tasks, :only => [:new, :edit, :show, :destroy]
end
