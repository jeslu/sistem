Rails.application.routes.draw do
  
  resources :products
  resources :clients do
    resources :acounts
  
    end
   
   
  resources :extents
  resources :marks
  resources :categories
  devise_for :users
  #get 'home/index'
  root "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

# agregar articulos ejemplo:
resources :articles do
  resources :comments
end
#resources :articles
#get "/articles", to: "articles#index"
#get "/articles/:id", to: "articles#show"

end
