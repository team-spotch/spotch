class UsersController < ApplicationController
	def index
		@users = User.all
	end
	def show
		@user = User.find(params[:id])
	end
	def edit
		@user = User.find(params[:id])
	end


	def follows
		@user = User.find(params[:id])
	end
	def followers
		@user = User.find(params[:id])
	end
end
