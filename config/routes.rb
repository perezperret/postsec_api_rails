Rails.application.routes.draw do
  resources :institutions, only: :index

  root to: 'pages#index'
end
