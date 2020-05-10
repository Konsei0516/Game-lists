Rails.application.routes.draw do
  root to: "reviews#index"
  resources :review do
    collection do
      get 'rakuten_search', to: 'reviews#rakuten_search'
    end
  end
end