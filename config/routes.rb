Rails.application.routes.draw do
  resources :users do
    resources :users, only: [:index, :show]
    resources :posts, only: [:index, :show]
  end
end
