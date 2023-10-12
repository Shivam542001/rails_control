Rails.application.routes.draw do
  resources :users, only: [:new, :index, :update, :destroy, :edit, :create] 
  get 'users/:id', to: "users#show", as: "admi"
   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
  get '/stories', to: redirect('/users')

end
