class CircleEventTicketsController < ApplicationController

	before_action :authenticate_user!

	def create
		ticket = CircleEventTicket.new
		ticket.user_id = current_user.id
		ticket.circle_event_id = params[:id]
		ticket.confirm = false
		if ticket.save 
			redirect_to circle_circle_event_path(params[:circle_id],params[:id]),notice: "参加申請できました"
		else
			redirect_to circle_circle_event_path(params[:circle_id],params[:id]),alert: "参加申請できませんでした"
		end
		
	end

	def destroy
		ticket = CircleEventTicket.find_by!(circle_event_id: params[:id],user_id: current_user.id)
		ticket.destroy
		redirect_to circle_circle_event_path(params[:circle_id],params[:id]),notice: "参加をキャンセルしました"
	end

	def approve 
		ticket = CircleEventTicket.find(params[:ticket_id])
		ticket.confirm = true
		ticket.save 
		redirect_to circle_circle_event_path(params[:circle_id],params[:id]),notice: "参加を承認しました。"
	end


end
