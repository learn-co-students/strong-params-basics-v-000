Rails.application.routes.draw do
  root to: 'posts#index'
  resources :posts, only: [:index, :show, :new, :create, :edit, :update]
end
