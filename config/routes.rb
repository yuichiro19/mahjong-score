Rails.application.routes.draw do
  devise_for :users
  get 'games/index'
  root to: "games#index"
  resources :users, only: :show
  resources :games, only: [:index, :new, :create] do
    resources :scores, only: [:index, :create, :show]
  end
end
