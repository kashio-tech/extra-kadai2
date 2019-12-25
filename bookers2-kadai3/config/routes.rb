Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  root 'home#top'
  get 'home/about'
  devise_for :users #サインの画面が表示できないため、resourcesより上部に表示
  resources :users,only: [:show,:index,:edit,:update]
  resources :books do
  	resource :favorites, only: [:create, :destroy]
  	resource :book_comments, only: [:create]
  end
  resources :book_comments, only: [:destroy]
end
