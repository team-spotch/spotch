class CircleTalksController < ApplicationController

	before_action :authenticate_user!
	before_action :circle_member?

	def show
		@circle_talks = CircleTalk.where(circle_id: params[:circle_id])
	end

	def create
		@circle_talk = CircleTalk.new(circle_talk_params)
		@circle_talk.user_id = current_user.id
		@circle_talk.circle_id = params[:circle_id]

		if @circle_talk.save 
			redirect_to circle_circle_talks_path,notice: "メッセージ送信成功しました"
		else
			redirect_to circle_circle_talks_path,alert: "メッセージ送信に失敗しました"
		end

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

