class CircleLikesController < ApplicationController
	before_action :authenticate_user!

	def create
		circle = Circle.find(params[:circle_id])
		circle_like = current_user.circle_likes.build(circle_id: circle.id)
		if circle_like.save 
#			redirect_to circle_path(circle.id),notice: "いいねしました"
			redirect_to(:back)
		else
			redirect_to(:back)
		end
	end

	def destroy
		circle = Circle.find(params[:circle_id])
		circle_like = current_user.circle_likes.find_by!(circle_id: circle.id)
		circle_like.destroy
#		redirect_to circle_path(params[:circle_id]),notice: "いいねを取り消しました"
		redirect_to(:back)
	end


end
