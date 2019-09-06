Rails.application.routes.draw do
  
  root 'trips#index'
  devise_for :users
  
  resources :trips do 
    resources :locations
    resources :reviews 
  end

  resources :locations do 
    resources :addresses
  end

  
end
