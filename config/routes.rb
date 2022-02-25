Rails.application.routes.draw do
  get "contact", to: "pages#contact"
  get 'pages/about'
  get 'pages/home'
  get 'pages/teste'
  get "blog", to: redirect("http://www.google.com")
  resources :projects
  get "error", to: "pages#error"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
  get "*path", to: redirect("error")
end
