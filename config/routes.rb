Rails.application.routes.draw do
  root 'events#index'
  resources :events do
    resources :questions
  end
end
