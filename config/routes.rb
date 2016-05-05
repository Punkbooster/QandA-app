Rails.application.routes.draw do
  devise_for :clients

  devise_for :users
  root 'events#index'

  namespace :admin do
    devise_for :admins
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
