Rails.application.routes.draw do

  devise_for :users
  resources :users, only [:update]
  #   set routing for post controller 
  resources :topics do
    resources :posts, except: [:index]
  end

  #   about route
  get 'about' => 'welcome#about'

  #   declare default page
  root to: 'welcome#index'
end