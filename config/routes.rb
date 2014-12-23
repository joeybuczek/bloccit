Rails.application.routes.draw do
  
  #   set routing for post controller 
  resources :posts

  #   about route
  get 'about' => 'welcome#about'

  #   declare default page
  root to: 'welcome#index'
end