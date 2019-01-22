Rails.application.routes.draw do

  get 'home/about'
  devise_for :users
  root "home#top"
  resources :books, only:[:new, :index, :show, :edit, :create, :destroy, :update]
  delete '/books/:id' => 'books#destroy', as: 'destroy_book'
  resources :users, only:[:show,:edit,:index, :update, :create, :destroy]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
