Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to:  'pages#home'
  resources :lists do
    resources :flashcards, only: [:new, :create]
  end
  resources :flashcards, only: [:edit, :update, :destroy]
  #   resources :doses, only: [:create]
  #   resources :reviews, only: [:create]
  # end
  # resources :doses, only: [:destroy]
end
