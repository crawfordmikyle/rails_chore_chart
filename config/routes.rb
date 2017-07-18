Rails.application.routes.draw do
  devise_for :users
  root to: "static_pages#index"
  get 'user/:id' => 'users#show', as: :user_show
  get 'users' => 'users#index', as: :users
  resources :teams, :only => [:index, :new, :edit, :show, :create, :destroy]
  resources :friendships, :only => [:new, :edit, :show, :create, :destroy]
  resources :chores, :only => [:new, :edit, :show, :create, :destroy]
  resources :tasks, :only => [:new, :edit, :show, :create, :update, :destroy]
end
