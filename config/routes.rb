Rails.application.routes.draw do
  get 'custom_users/show'
  get 'home/index'
  devise_for :users

  resources :users, only: [:show, :edit, :update]

  resources :sakes, only: [:index, :show] do
    resources :reviews, only: [:index, :new, :create, :edit, :update, :destroy]
    collection do
      post :fetch_sake_data
    end
    collection do
      get 'search'
    end
  end

  root 'home#index'
end
