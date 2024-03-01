Rails.application.routes.draw do
  get 'item_infos/index'
  get 'item_infos/new'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "items#index"
  resources :items ,only: [:index, :new, :edit, :update, :edit]
  resources :item_info
  # Defines the root path route ("/")
  # root "articles#index"
end
