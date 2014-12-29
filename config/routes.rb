Rails.application.routes.draw do
  
  devise_for :users
  #   set routing for post controller 
  resources :posts

  #   about route
  get 'about' => 'welcome#about'

  #   declare default page
  root to: 'welcome#index'
end