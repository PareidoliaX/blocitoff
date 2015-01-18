Rails.application.routes.draw do

  devise_for :users # , :controllers => { :registrations => 'users/registrations' } 
  
  resources :lists, except: [:index]

  root to: 'shallows#home'
  
end
