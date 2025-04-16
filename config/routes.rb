Rails.application.routes.draw do
  resources :images
  devise_for :users, :controllers => { registrations: 'registrations' }
  get 'welcome/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'welcome#index'
  get 'users', to: 'users#index'
end
