Rails.application.routes.draw do
  root 'home#top'
  get 'home/about' =>'home#about'
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update,:create,:destroy]
  resources :books,only: [:index,:edit,:show,:update,:create,:destroy] do
  	resource :favorites,only: [:create,:destroy]
  	resources :book_comments, only: [:create, :destroy]
  end
  
  
  
end
