Rails.application.routes.draw do
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post '/signout', to: 'sessions#destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :characters, only: %i[show index edit new]
  end
  resources :characters
  # Defines the root path route ("/")
  root 'welcome#home'
end
