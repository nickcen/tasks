Tasks::Application.routes.draw do

  devise_for :users

  resources :tasks do
    resources :applies

    member do
      post :cancel
    end
  end

  resources :users do
    resources :applies, :only => :index
    resources :tasks, :only => :index
  end

  resources :applies do
    member do
      post :assign
      post :cancel
      post :abandon
      post :complete
      post :confirm
    end
  end
  
  root :to => 'tasks#index'
end
