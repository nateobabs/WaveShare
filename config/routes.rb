Rails.application.routes.draw do
  devise_for :users
  root to: "beaches#index"
  get "/dashboard", to: "pages#dashboard"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :profile
  resources :reviews , except: [:new, :create, :edit, :update]
  resources :events , except: [:new, :create]
  resources :user_events, except: [:new, :create]

  resources :beaches do
    resources :reviews, only:[:new, :create]
    resources :events, only:[:new, :create]
    resources :user_events, only:[:new, :create]
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
