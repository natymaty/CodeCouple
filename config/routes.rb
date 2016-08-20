Rails.application.routes.draw do
  get 'contact_form/new'

  get 'contact_form/create'

  resources :entries do
    resources :comments
  end

  resources :contact_forms

  root 'entries#index'

  match '/about', to: 'pages#about', via: [:get, :post]
  match '/pictures', to: 'pages#pictures', via: [:get, :post]
  match '/contact', to: 'contact_forms#new', via: [:get, :post]
end
