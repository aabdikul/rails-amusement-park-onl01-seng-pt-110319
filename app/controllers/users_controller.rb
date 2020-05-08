require 'pry'

class UsersController < ApplicationController
	include UsersHelper

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
			if @user.save! 
				session[:user_id] = @user.id
				redirect_to user_path(@user)
			else 
				redirect_to root_path
			end
	end

	def show 
		if logged_in? 
			@user = User.find_by(id: params[:id]) 
			if @user.admin == true 
				flash[:message] = "ADMIN"
			end
		else 
			redirect_to root_path
		end
	end


	private 

		def user_params
			params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
		end

end