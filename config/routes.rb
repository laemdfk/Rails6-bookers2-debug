Rails.application.routes.draw do

  root to: "homes#top"
  # root :toをroot to:へ変更
  devise_for :users
  get "home/about"=>"homes#about"

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
   resources :book_comment, only: [:create, :destroy]
   resource :favorites, only: [:create, :destroy]
 end


  resources :users, only: [:index,:show,:edit,:update]do
   get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
   resource :relationship,only:[:create, :destroy]
 end

 get "search" => "searches#search"

# endを追加し、ルーティングの順番変更
end