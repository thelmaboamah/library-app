class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		login(@user)
		redirect_to @user 
	end

	def show
		@user = User.find(params[:id])
		if @user != @current_user
			redirect_to users_path
		end
	end

	private
	
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password)
	end
end
