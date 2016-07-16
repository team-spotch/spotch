Rails.application.routes.draw do
  resources :circle_events
  resources :circles do
    resource :circle_users,only: [:create,:destroy]
  end
  devise_for :users

end
