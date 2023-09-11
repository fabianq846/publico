Rails.application.routes.draw do
  namespace :admin do
    resources :users, only: [:new, :create, :edit, :update, :destroy]
  end
  
  devise_for :users

  root 'home#index'

  resources :job_offers do
    resources :applications, only: [:create]
  end
  resources :users, except: :destroy

end
