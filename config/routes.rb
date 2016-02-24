Rails.application.routes.draw do

  resources :lists, except: :index do
    resources :items
    resources :collaborations, only: [:create, :destroy]
  end

  devise_for :users
  resources :users, only: :show

  root to: "pages#index"
end
