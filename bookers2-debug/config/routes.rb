Rails.application.routes.draw do
  root 'home#top'
  get 'home/about'
  devise_for :users #サインの画面が表示できないため、resourcesより上部に表示
  resources :users,only: [:show,:index,:edit,:update]
  resources :books
end
