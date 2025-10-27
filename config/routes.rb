Rails.application.routes.draw do
  resources :products, only: [:new, :create, :destroy]
  root 'pages#home'
  get '/:id', to: 'pages#show', as: :page
end
