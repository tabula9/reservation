Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get 'top/search'
  get "users/account" => "users#account"
  get "users/profile" => "users#profile"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'top#search'
end
