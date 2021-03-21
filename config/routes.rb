Rails.application.routes.draw do
  devise_for :users
  get 'games/index'
  root to: "games#index"
  resources :games, only: [:index, :new, :create] do
    resources :scores only: [:new, :create]
  end
end
