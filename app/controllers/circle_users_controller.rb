class CircleUsersController < ApplicationController

	def create
		circleUser = current_user.circle_users.build(circle_id: params[:circle_id])

		if circleUser.save 
			redirect_to circle_path(params[:circle_id]),notice: "サークルに参加しました"
		else
			redirect_to circle_path(params[:circle_id]),alert: "サークルに参加できませんでした"
		end

	end

	def destroy
		circleUser = current_user.circle_users.find_by(circle_id: params[:circle_id])
		circleUser.destroy

		redirect_to circle_path(params[:circle_id]),notice: "サークルを退会しました"
	end

end
