Rails.application.routes.draw do
  get "contact", to: "pages#contact"
  get 'pages/about'
  get 'pages/home'
  get 'pages/teste'
  get "blog", to: redirect("http://www.google.com")
  get "error", to: "pages#error"


  resources :projects do
    resources :tasks, except: [:index], controller: 'projects/tasks'
  end

  


  root "pages#home"
  get "*path", to: redirect("error")
end
