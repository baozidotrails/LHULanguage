Rails.application.routes.draw do

  root               'demands#index'
  get    'signup' => 'users#new'
  get    'login'  => 'sessions#new'
  post   'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :users do
    resources :notifications, only: [:index, :create]
  end

  resources :demands do
    member do
      post :apply
      post :cancel_apply
    end
  end
end
