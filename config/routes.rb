Rails.application.routes.draw do
  root to: 'application#home'
  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: 'callbacks'}
  devise_scope :user do 
    get 'login', to: 'devise/session#new'
    get 'signup', to: 'devise/registration#new'
  end
  get '/products/search', to: 'products#search', as: 'products_search'
  get 'products/expensive', to: 'products#expensive', as: 'products_expensive'
  resources :products
  
  resources :categories do 
    resources :categories, only: [:index, :new, :show]
    resources :products, only: [:index, :new, :show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
