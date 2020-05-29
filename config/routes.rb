Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  get 'youtubes/index'
  devise_for :users, controllers:{
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  
  root to: "reviews#index"
  resources :reviews do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
    collection do
      get 'rakuten_search', to: 'reviews#rakuten_search'
    end
  end

  resources :users
end