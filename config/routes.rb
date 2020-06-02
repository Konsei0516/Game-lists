Rails.application.routes.draw do
  get 'youtubes/index'
  devise_for :users, controllers:{
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  
  root to: "reviews#index"
  resources :reviews do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
    collection do
      get 'rakuten_search', to: 'reviews#rakuten_search'
      get 'search', to: 'reviews#search'
    end
  end

  get "users/:id/like" => "users#like"
  resources :users
end