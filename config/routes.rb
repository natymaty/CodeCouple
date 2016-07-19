Rails.application.routes.draw do
  resources :entries do
    resources :comments
  end

  root 'entries#index'
end
