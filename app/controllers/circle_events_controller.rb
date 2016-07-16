class CircleEventsController < ApplicationController

	before_action :authenticate_user!, except: :index

	def index
		@circle_events = CircleEvent.all
	end

	def show
		@circle_event = CircleEvent.find(params[:id])
	end

	def new
		@circle_event = CircleEvent.new		
	end

	def create
		circle_event = CircleEvent.new(circle_event_params)

		if circle_event.save
			redirect_to circle_events_path,notice: "イベント作成に成功しました"
		else
			redirect_to :new,alert: "イベント作成に失敗しました"
		end
	end

	def edit
		@circle_event = CircleEvent.find(params[:id])
	end

	def update
		@circle_event = CircleEvent.find(params[:id])
		if @circle_event.update(circle_event_params)
			redirect_to circle_event_path(params[:id]),notice: "イベント内容を更新しました"
		else
			redirect_to :new,alert: "イベント内容の更新に失敗しました"
		end
	end

	def destroy
		@circle_event = CircleEvent.find(params[:id])
		@circle_event.destroy
		redirect_to circle_events_path,notice: "イベントを削除しました"
	end

	private 
	def circle_event_params
		params.require(:circle_event).permit(:title,:desc,:event_date,:place,:one_phrase)
	end


end
