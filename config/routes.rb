Rails.application.routes.draw do
  resources :categories
  
  resource :session
  
  get "signin" => "session#new"
  get "signup" => "users#new"
  resources :users
  
  root "books#index"

  get "books/filter/:scope" => "books#index", as: :filtered_books
  #%w(free past).each do |scope|
  #  get "books/#{scope}" => "books#index", scope: scope
  #end
  resources :books do
    resources :reviews
    resources :likes
  end
  #resources :events do
  #  resources :registrations
  #end
end
