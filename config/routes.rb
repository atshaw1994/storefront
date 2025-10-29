Rails.application.routes.draw do
  resources :products, only: [:new, :create, :destroy]
  root 'pages#home'
  get '/:id', to: 'pages#show', as: :page
  post 'add_to_cart', to: 'carts#add', as: :add_to_cart
  post 'remove_one_from_cart', to: 'carts#remove_one', as: :remove_one_from_cart
  post 'remove_from_cart', to: 'carts#remove', as: :remove_from_cart
  post '/cleanup_user', to: 'application#cleanup_user'
end
