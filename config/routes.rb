Rails.application.routes.draw do
#   set routing info for index and about
  get 'welcome/index'
  get 'welcome/about'

#   declare default page
  root to: 'welcome#index'
end