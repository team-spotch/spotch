Rails.application.routes.draw do
  resources :circles do
    resource :circle_users,only: [:create,:destroy]
    resources :circle_events

  end
  devise_for :users

end
