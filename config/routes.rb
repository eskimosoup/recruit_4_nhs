Rails.application.routes.draw do
  resources :applications, only: [:new, :create]
  root to: "applications#new"
  mount Optimadmin::Engine => "/admin"
end
Optimadmin::Engine.routes.draw do
  resources :applications, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
    end
  end
end