class UsersController < ApplicationController
	before_action :require_login, only: [:show, :edit]
	before_action :set_user, only: [:show, :edit, :update]

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
		if current_user != @user
			flash[:error] = "You are not allowed to view this profile."
			redirect_to root_path
		else
		render :show
		end
	end

	def edit
		unless current_user == @user
			redirect_to user_path(current_user)	
		end
	end

	def update
		if current_user == @user
			if @user.update_attributes(user_params)
				flash[:notice] = "Successfully updated."
				redirect_to user_path(@user)
			else
				flash[:error] = @user.errors.full_messages.join(", ")
				redirect_to edit_user_path(@user)
			end
		else
			redirect_to user_path(current_user)
		end
	end

	private
	
		def user_params
			params.require(:user).permit(:first_name, :last_name, :email, :password)
		end

		def set_user
			user_id = params[:id]
			@user = User.find_by_id(user_id)
		end
end
