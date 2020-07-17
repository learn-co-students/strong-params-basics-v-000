Rails.application.routes.draw do
  resources :posts, only: [:index, :new, :create, :show, :update, :edit]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts, only: [:index, :show, :new, :create, :edit, :update]
end
