Rails.application.routes.draw do
  root "pages#index"

  get '/about', to: 'pages#about'

  get '/blog', to: 'blog_posts#index'
  resources :blog_posts, only: [:index, :show]
  get "/blog_posts/:id", to: "blog_posts#show"

  get '/books', to: 'pages#books'
  get '/contact', to: 'pages#contact'
  get '/experimental', to: 'pages#experimental'
  get '/index', to: 'pages#index'
  get '/portfolio', to: 'pages#portfolio'

  resources :portfolios
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
