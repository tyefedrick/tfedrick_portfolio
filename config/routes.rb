Rails.application.routes.draw do
  root "pages#index"

  get '/about', to: 'pages#about'

  #creates primary crud (create,read,update,and delete) actions
  resources :blog_posts, only: [:index, :show, :new, :create]

  #remove the only
  resources :book_reviews
  resources :genres
  resources :authors



  get '/resume', to: 'pages#resume'
  get '/contact', to: 'pages#contact'
  get 'contact', to: 'contacts#new', as: 'new_contact'
  post 'contact', to: 'contacts#create', as: 'create_contact'


  get '/experimental', to: 'pages#experimental'
  get '/index', to: 'pages#index'
 
  resources :portfolios


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
