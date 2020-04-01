Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  get 'explore', to: 'pages#explore', as: :explore
  get 'account', to: 'pages#account', as: :account

  resources :posts, except: %i[index] do
    resources :likes, only: %i[create]
  end

  resources :users, only: %i[show], param: :username
end
