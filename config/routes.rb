Rails.application.routes.draw do
  devise_for :users
  root 'users#new'
  get '/home/about' =>'books#about', as: 'about'
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]
  resources :users, only: [:show, :edit ,:index, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
