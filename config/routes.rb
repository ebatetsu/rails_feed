Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'feeds#index'
  post '/feeds_update', to: 'feeds#feeds_update'

  get '/search', to: 'search#index'

  resources :feeds do
    resources :entries, only: [:show]
  end

  get  '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  resources :users, except: [:new, :create] do
    member do
      get :following, :followers
    end
  end

  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :microposts, only: [:create]
  resources :relationships, only: [:create, :destroy]
end
