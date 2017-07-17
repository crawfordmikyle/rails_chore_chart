Rails.application.routes.draw do
  devise_for :users
  root to: "static_pages#index"
  get 'user/:id' => 'users#show', as: :user_show
end
