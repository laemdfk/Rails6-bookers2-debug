Rails.application.routes.draw do

  get 'favorite/create'
  get 'favorite/destroy'
  root to: "homes#top"
  # root :toをroot to:へ変更
  devise_for :users
  get "home/about"=>"homes#about"

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update]
   resource :favorites, only[:create,:destroy]
  resources :users, only: [:index,:show,:edit,:update]


# endを追加し、ルーティングの順番変更
end