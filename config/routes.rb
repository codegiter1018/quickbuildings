Rails.application.routes.draw do
  devise_for :users
 
  root to: "buildings#index"
 resources :buildings, only:[:new,:create,:show,:edit,:update,:destroy]do
 resources :comments,  only: [:create, :destroy]
end
  resources :users, only: :show
end
