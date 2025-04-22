Rails.application.routes.draw do
  resources :images
  resources :users, only: [:index, :show] do
    member do
      get :following
      get :followers
    end
  end
  resources :follows, only: [:create, :destroy]
  devise_for :users, :controllers => { registrations: 'registrations' }
  get 'welcome/index'
  root 'welcome#index'
  get 'users', to: 'users#index'
end
