Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  resources :job_offers do
    resources :applications, only: [:create]
  end
  resources :users, except: :destroy

end
