class CircleEventsController < ApplicationController

	before_action :authenticate_user!, except: :index
	before_action :set_circle
	before_action :event_authentication,only: [:new,:create,:update,:destroy]

	def index
		@circle_events = CircleEvent.where(circle_id: params[:circle_id])

	end

	def show
		@circle_event = CircleEvent.find(params[:id])
	end

	def new
		@circle_event = CircleEvent.new		
	end

	def create
		circle_event = CircleEvent.new(circle_event_params)
		circle_event.circle_id = params[:circle_id] 

		if circle_event.save
			redirect_to circle_circle_events_path(@circle),notice: "イベント作成に成功しました"
		else
			redirect_to new_circle_circle_event_path(@circle),alert: "イベント作成に失敗しました"
		end
	end

	def edit
		@circle_event = CircleEvent.find(params[:id])
	end

	def update
		@circle_event = CircleEvent.find(params[:id])
		if @circle_event.update(circle_event_params)
			redirect_to circle_circle_event_path(@circle,params[:id]),notice: "イベント内容を更新しました"
		else
			redirect_to :new,alert: "イベント内容の更新に失敗しました"
		end
	end

	def destroy
		@circle_event = CircleEvent.find(params[:id])
		@circle_event.destroy
		redirect_to circle_circle_events_path,notice: "イベントを削除しました"
	end

	private 
	def circle_event_params
		params.require(:circle_event).permit(:title,:desc,:event_date,:place,:one_phrase)
	end

	def set_circle
		@circle = Circle.find(params[:circle_id])
	end

	def event_authentication
		unless current_user.circle_users.where(circle_id: params[:circle_id]).exists?
			redirect_to circle_circle_events_path
		end
	end

end
