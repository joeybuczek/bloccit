Rails.application.routes.draw do

  #   get 'comments/new'

  #   set routing for users controller
  devise_for :users
  resources :users, only: [:update]
  
  #   set routing for topic, post, and comment controllers
  resources :topics do
    resources :posts, except: [:index] do
      resources :comments, only: [:create]
    end
  end

  #   about route
  get 'about' => 'welcome#about'

  #   declare default page
  root to: 'welcome#index'
end