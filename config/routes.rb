Rails.application.routes.draw do

  resources :lists do
    resources :items
  end

  devise_for :users
  resources :users, only: :show

  root to: "pages#index"
end
