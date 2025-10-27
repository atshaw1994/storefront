Rails.application.routes.draw do
  root 'pages#home'
  get '/:id', to: 'pages#show', as: :page
end
