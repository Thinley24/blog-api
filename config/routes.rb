Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # get '/' => "users#index"
  # post "/sessions" => "sessions#create"
  # post "/users" => "users#create"
  # get "/dashboard" => "articles#index"

  # Defines the root path route ("/")
  root "articles#index"

  # get "/articles", to: "articles#index"
  # get "/articles/:id", to: "articles#show"

  # a nested resource
  resources :articles do #resources -- maps all of the conventional routes for a collection of resources (such as articles)
    resources :comments
  end
end
