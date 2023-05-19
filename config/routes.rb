Rails.application.routes.draw do
  resources :users, only: [:index, :show, :new] do
    resources :posts, only: [:index, :show, :new] do
      resources :likes, only: [:create]
    end
  end
end
