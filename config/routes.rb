Rails.application.routes.draw do
  devise_for :clients

  devise_for :users
  devise_for :admins
  root 'home#index'

  namespace :admin do
    root 'home#index'
    resources :events do
      resources :questions do
        member do
          put "like", to: "questions#upvote"
        end
      end
    end
  end
  resources :events do
    resources :questions do
      member do
        put "like", to: "questions#upvote"
      end
    end
  end
end
