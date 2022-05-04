Rails.application.routes.draw do

  get 'favorite/create'
  get 'favorite/destroy'
  root to: "homes#top"
  # root :toをroot to:へ変更
  devise_for :users
  get "home/about"=>"homes#about"

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
   resources :book_comment, only: [:create, :destroy]
   resource :favorites, only: [:create, :destroy]
 end


  resources :users, only: [:index,:show,:edit,:update]do
   member do
    get :follows, :followers
   end
   resource :relationship,only:[:create, :destroy]
 end


# endを追加し、ルーティングの順番変更
end