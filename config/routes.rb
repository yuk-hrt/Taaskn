Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'lists#index'
  resources :users
  resources :lists do
    resources :cards do
      put :sort
    end
    resources :likes, only: [:create, :destroy]
  end
  post 'linebot/bot'
end
