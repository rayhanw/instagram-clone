Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  get 'explore', to: 'pages#explore', as: :explore

  resources :posts, except: %i[index edit update] do
    resources :likes, only: %i[index create]
    resources :comments, only: %i[index create]
  end

  resources :likes, only: %i[destroy]

  resources :users, only: %i[show], param: :username

  resources :direct_messages, only: %i[index show] do
    resources :messages, only: :create
  end
end
