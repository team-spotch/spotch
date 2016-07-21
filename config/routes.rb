Rails.application.routes.draw do
  resources :circles do
    resource :circle_users,only: [:create,:destroy]
    
  end
  devise_for :users

  resources :circle_events

end
