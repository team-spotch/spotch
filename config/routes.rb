Rails.application.routes.draw do
  resources :circles do
    resource :circle_users,only: [:create,:destroy]
    resources :circle_events
    resource :circle_talks,only: [:show,:create]
  end

  devise_for :users

  post "/circle_events/:id/talks" => "circle_event_talks#create",as: "circle_event_talks"

  post "/circles/:circle_id/circle_events/:id/attend" =>"circle_event_tickets#create",as: "circle_event_attend"
  delete "/circles/:circle_id/circle_events/:id/attend" =>"circle_event_tickets#destroy",as: "destroy_circle_event_attend"
  post "/circles/:circle_id/circle_events/:id/attend/:ticket_id" =>"circle_event_tickets#approve",as: "approve_circle_event_attend"

end
