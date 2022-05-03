Rails.application.routes.draw do

  get 'book_comments/create'
  get 'book_comments/destroy'
  get 'favorite/create'
  get 'favorite/destroy'
  root to: "homes#top"
  # root :toをroot to:へ変更
  devise_for :users
  get "home/about"=>"homes#about"

  resources :books do
   resource :favorites, only: [:create, :destroy]
 end

  resources :users, only: [:index,:show,:edit,:update]


# endを追加し、ルーティングの順番変更
end