Rails.application.routes.draw do
  devise_for :nannies
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :nannies, only: [:index, :show] do
    resources :reservations, only: [:new, :create]
  end
end
