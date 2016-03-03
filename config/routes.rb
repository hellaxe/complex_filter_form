Rails.application.routes.draw do
  root 'home#index'
  resources :searches, only: [:index, :new, :create, :show] do
  end
end
