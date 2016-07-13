Rails.application.routes.draw do
  root 'homes#index'

  resource :dashboard, only: [:show] do
    resources :repos, only: [:index]
  end

  get '/auth/github', as: :github_login
  get '/auth/github/callback', to: "sessions#create"
  delete '/logout', to: "sessions#destroy", as: :logout
end
