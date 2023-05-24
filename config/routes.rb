Rails.application.routes.draw do
  root :to => redirect('users')
  devise_for :users
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :likes, only: [:create]
      resources :comments, only: [:show, :new, :create]
    end
  end
end
