Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    get 'profile_edit', to: 'users/registrations#profile_edit', as: 'profile_edit'
    patch 'profile_update', to: 'users/registrations#profile_update', as: 'profile_update'
  end
  get 'top/search'
  get "users/account" => "users#account"
  get "users/profile" => "users#profile"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'top#search'
end
