Rails.application.routes.draw do
  
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get 'sign_up', to: 'devise/registrations#new'
    post 'sign_up', to: 'devise/registrations#create'
    get 'sign_in', to: 'devise/sessions#new'
    post 'sign_in', to: 'devise/sessions#create'
    get 'sign_out', to: 'devise/sessions#destroy', as: :sign_out
    delete 'sign_out', to: 'devise/sessions#destroy'
    get 'profile/edit', to: 'devise/registrations#edit'

  end
  resources :users, only: [:show], constraints: { user_url: /\d.+/ } #:constraints => { :id => /[0-9|]+/ }
  resources :friendships, only: [:create, :destroy]
  resources :user_stocks, only: [:create, :destroy]
  get 'search', to: 'stock#search'
  get 'search_friend', to: 'users#search'
  get 'portfolio', to: 'users#portfolio'
  root 'home#index'
  get 'home/index'
  get 'pricing', to: 'home#pricing'
  get 'friends', to: 'users#friends'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
