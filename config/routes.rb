Rails.application.routes.draw do

  resources :lists, except: :index do
    resources :items do
      patch '/complete' => "items#complete", as: :complete
    end
    resources :collaborations, only: [:create, :destroy]
  end

  devise_for :users
  resources :users, only: [:index, :show, :update]

  root to: "pages#index"
end
