Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'
  get 'home/about' => 'homes#about'
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:create, :index, :show, :edit, :update, :destroy]
  resources :groups, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    #グループ参加のルーティング
    get :join
  end
  
end
