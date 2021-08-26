Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'my_monkeys', to: 'monkeys#my_monkeys', as: :about

  get 'booking_confiramtion', to: 'rentals#confirmation', as: :confirm
  resources :monkeys, only: [:index, :new, :create, :show] do
    resources :rentals, only: [:create]
  end
end
