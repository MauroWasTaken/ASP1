Rails.application.routes.draw do
  resources :lectures
  resources :grades
  devise_for :people, controllers: {
    sessions: 'people/sessions',
    registrations: 'people/registrations'
  }
  devise_scope :person do
    get 'login', to: 'people/sessions#new'
    get 'logout', to: 'people/sessions#destroy'
    get 'signup', to: 'people/registrations#new'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  # Defines the root path route ("/")
  # root "articles#index"
end
