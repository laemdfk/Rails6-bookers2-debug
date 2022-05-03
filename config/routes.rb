Rails.application.routes.draw do

  get 'favorite/create'
  get 'favorite/destroy'
  root to: "homes#top"
  # root :toをroot to:へ変更
  devise_for :users
  get "home/about"=>"homes#about"

  resources :books do
   resource :book_comment, only: [:create, :destroy]
   resource :favorites, only: [:create, :destroy]
 end


  resources :users, only: [:index,:show,:edit,:update]


# endを追加し、ルーティングの順番変更
end