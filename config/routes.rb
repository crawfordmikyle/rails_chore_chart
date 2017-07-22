Rails.application.routes.draw do
  devise_for :users
  root to: "static_pages#index"
  get 'user/:id' => 'users#show', as: :user
  get 'users' => 'users#index', as: :users
  resources :teams, :only => [:index, :new, :edit, :show, :create, :destroy]
  resources :friendships, :only => [:create, :update, :destroy]
  resources :tasks, :only => [:new, :edit, :show, :create, :update, :destroy]
  resources :friendship_requests, :only => [:create, :update, :destroy]
  resources :user_team_requests, :only => [:create, :update, :destroy]
  resources :user_teams, :only => [:create, :update, :destroy]

  namespace :teams do
    resources :chores, :only => [:new, :edit, :show, :create, :destroy]
  end
end
