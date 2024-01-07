Rails.application.routes.draw do
  resources :articles
  get 'analytics/index'
  root 'articles#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
