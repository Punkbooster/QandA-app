Rails.application.routes.draw do
  devise_for :clients
  devise_for :admins
  devise_for :users
  root 'events#index'

  resources :events do
    resources :questions do
      member do
        put "like", to: "questions#upvote"
      end
    end
  end
end
