Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: "static_pages#index"
  get 'user/:id' => 'users#show', as: :user
  get 'users' => 'users#index', as: :users
  resources :teams, :only => [:index, :new, :edit, :show, :create, :destroy]
  resources :friendships, :only => [:destroy]
  resources :tasks, :only => [:new, :edit, :show, :create, :update, :destroy]
  resources :friendship_requests, :only => [:create, :update, :destroy]
  resources :user_team_requests, :only => [:create, :update, :destroy]
  resources :chores

  get 'teams/:team_id/chores/new' => 'chores#new', as: :new_team_chore
  post 'teams/:team_id/chores/new' => 'chores#create', as: :create_team_chore
  get 'teams/:team_id/chores' => 'chores#show', as: :team_chores
  get 'teams/:team_id/chore/:chore_id' => 'chore#show', as: :team_chore

  post 'user_teams/:id' => 'user_teams#destroy', as: :destroy_user_team

end
