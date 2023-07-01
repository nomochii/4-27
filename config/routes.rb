Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get "/homes/about" => "homes#about", as: "about"
  patch 'books/:id' => 'books#update', as: 'update_book'
  post 'books' => 'books#create'  

  resources :books
  resources :users, only: [:show, :index, :edit, :update]

end
