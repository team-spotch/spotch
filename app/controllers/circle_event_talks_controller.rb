class CircleEventTalksController < ApplicationController



	def create
		talk = CircleEventTalk.new(circle_event_talk_params)
		talk.user_id = current_user.id
		talk.circle_event_id = params[:id] 
		event = CircleEvent.find(params[:id])
		circle_id = event.circle.id

		if talk.save 
			redirect_to circle_circle_event_path(circle_id,params[:id]),notice: "投稿されました"
		else
			redirect_to circle_circle_event_path(circle_id,params[:id]),alert: "投稿できませんでした"
		end
	end

	private
	def circle_event_talk_params
		params.permit(:body)
	end



end
