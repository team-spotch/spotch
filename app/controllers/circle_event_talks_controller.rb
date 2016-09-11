class CircleEventTalksController < ApplicationController



	def create
		talk = CircleEventTalk.new(circle_event_talk_params)
		talk.user_id = current_user.id
		talk.circle_event_id = params[:id] 
		event = CircleEvent.find(params[:id])
		circle_id = event.circle.id
		talk.save

		line = "circle_event_talk_" + params[:id].to_s
		if current_user.user_prof.try(:image)
			user_image = current_user.user_prof.image.url
		else
			user_image = 'user_noimage_default-92ed5a1a77657124f60ae8717ac534ebab88b5bc4491df113c2b72cbb90bf121.png'
		end

		Pusher.trigger(line,'chat_event',{
			message: circle_event_talk_params[:body],
			name: current_user.email,
			image: user_image
		})

	end

=begin
		if talk.save 
			redirect_to circle_circle_event_path(circle_id,params[:id]),notice: "投稿されました"
		else
			redirect_to circle_circle_event_path(circle_id,params[:id]),alert: "投稿できませんでした"
		end
	end
=end

	private
	def circle_event_talk_params
		params.permit(:body)
	end


end
