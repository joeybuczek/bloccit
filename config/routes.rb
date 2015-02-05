Rails.application.routes.draw do

  #   get 'comments/new'

  #   set routing for users controller
  devise_for :users
  resources :users, only: [:update, :show]
  
  #   set routing for topic, post, and comment controllers
  resources :topics do
    resources :posts, except: [:index]
  end

  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
    #   votes
    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote
  end
  
  #   about route
  get 'about' => 'welcome#about'

  #   declare default page
  root to: 'welcome#index'
end