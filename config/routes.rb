Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to:  'pages#home'
  resources :lists do
    resources :flashcards, only: [:new, :create]
  end
  resources :flashcards, only: [:edit, :update, :destroy]

  get "activity_feed", to: "pages#activity", as: :activity
  get "archive", to: "pages#archive", as: :archive

  #   resources :doses, only: [:create]
  #   resources :reviews, only: [:create]
  # end
  # resources :doses, only: [:destroy]
end
