Rails.application.routes.draw do
  devise_for :users
  root to: "reviews#index"
  resources :review do
    collection do
      get 'rakuten_search', to: 'reviews#rakuten_search'
    end
  end
end