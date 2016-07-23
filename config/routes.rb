Rails.application.routes.draw do
  resources :circles do
    resource :circle_users,only: [:create,:destroy]
    resources :circle_events
    resource :circle_talks,only: [:show,:create]
  end

  devise_for :users

end
