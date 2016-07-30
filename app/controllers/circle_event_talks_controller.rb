class CircleEventTalksController < ApplicationController



	def create
		talk = CircleEventTalk.new(circle_event_talk_params)
		talk.user_id = current_user.id
		talk.circle_event_id = params[:circle_event_id] 
		if talk.save 
			redirect_to circle_event_path(params[:circle_id],params[:circle_event_id]),notice: "投稿されました"
		else
			redirect_to circle_event_path(params[:circle_id],params[:circle_event_id]),alert: "投稿できませんでした"
		end
	end

	private
	def circle_event_talk_params
		params.permit(:body)
	end



end
