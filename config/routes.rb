Rails.application.routes.draw do
  devise_for :nannies
  devise_for :users
  root to: 'nannies#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_scope :nanny do
    resources :nannies, only: [:index, :show] do
      resources :reservations, only: [:index, :new, :create]
    end
  end
end
