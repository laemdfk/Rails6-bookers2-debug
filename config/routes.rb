Rails.application.routes.draw do
 
  root to: "homes#top"
  # root :toを　root to:へ変更
  devise_for :users
  get "home/about"=>"homes#about"

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update]
  resources :users, only: [:index,:show,:edit,:update]
 
 
# endを追加し、ルーティングの順番変更
end