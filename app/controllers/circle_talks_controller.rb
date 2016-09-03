class CircleTalksController < ApplicationController
	layout 'circle'

	before_action :authenticate_user!
	before_action :circle_member?

	def create
		@circle_talk = CircleTalk.new(circle_talk_params)
		@circle_talk.user_id = current_user.id
		@circle_talk.circle_id = params[:circle_id]
		@circle_talk.save 

		line = "circle_talk_" + params[:circle_id].to_s
		if current_user.user_prof.try(:image)
			user_image = current_user.user_prof.image.url
		else
			user_image = 'user_noimage_default.png'
		end

		Pusher.trigger(line,'chat_event',{
			message: circle_talk_params[:body],
			name: current_user.email,
			image: user_image
		})


=begin
		if @circle_talk.save 
			redirect_to circle_circle_talks_path,notice: "メッセージ送信成功しました"
		else
			redirect_to circle_circle_talks_path,alert: "メッセージ送信に失敗しました"
		end
=end

	end

	private
		def circle_talk_params
			params.permit(:body)
		end

		def circle_member?
	      	unless	current_user.circle_users.where(circle_id: params[:circle_id]).exists?
	      		redirect_to circle_path(params[:circle_id])
	      	end
		end
end

