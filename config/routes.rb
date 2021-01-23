Rails.application.routes.draw do
  resources :crews
  resources :concerts
  resources :groups
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
