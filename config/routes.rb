Rails.application.routes.draw do
  resources :weapons
  resources :characters
  root 'arena#index'
  get 'fight/:id', to: 'arena#fight', as: 'fight'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
