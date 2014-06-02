Rails.application.routes.draw do
  devise_for :users,
              controllers: {omniauth_callbacks: "omniauth_callbacks"}
  resources :projects do
    resources :comments
  end

  resources :posts do
    resources :comments
  end

  get 'welcome/index'
  root 'welcome#index'
end
