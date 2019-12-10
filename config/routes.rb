Rails.application.routes.draw do
  devise_for :nannies
  devise_for :users
  root to: 'pages#home'
  mount StripeEvent::Engine, at: '/stripe-webhooks'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_scope :nanny do
    resources :nannies, only: [:index, :show] do
      resources :reservations, only: [:new, :create]
      resources :conversations, only: [:index]
    end
    # get 'dashboard', to: 'nannies#dashboard'
  end
  resources :reservations, only: [:index] do
    resources :payments, only: [:new]
    patch 'payments', to: 'payments#update'
    get 'split', to: 'payments#new_split'
    post 'split', to: 'payments#split'
  end
  resources :messages, only: [:index, :create]

  namespace :nanny_space do
    resources :conversations
    resources :messages, only: [:new, :create]
  end
end
