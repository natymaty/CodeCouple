Rails.application.routes.draw do
  resources :entries do
    resources :comments
  end

  root 'entries#index'

  match '/about', to: 'pages#about', via: [:get, :post]
  match '/pictures', to: 'pages#pictures', via: [:get, :post]
  match '/contact', to: 'pages#contact', via: [:get, :post]
end
