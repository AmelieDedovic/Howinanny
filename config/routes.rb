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
  end
  resources :reservations, only: [:index] do
    resources :payments, only: [:new]
    patch 'payments', to: 'payments#update'
  end
  resources :messages, only: [:index, :create]
end
