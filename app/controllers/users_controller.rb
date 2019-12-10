class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:show, :index, :edit, :update]
	before_action :currentuser, only: [:update, :edit]
	def show
		@user = User.find(params[:id])
		@books = @user.books
		@book = Book.new
	end
	def index
		@users = User.all
		@book = Book.new
	end
	def edit
		@user = User.find(params[:id])
	end
	def new
	end
	def update
    	@user = User.find(params[:id])
	    if @user.update(user_params)
	    	redirect_to user_path(@user.id)
	    	flash[:notice] = "User was successfully updated."
		else
	        render :edit
		end
	end

private
	def user_params
	    params.require(:user).permit(:name, :profile_image, :introduction)
	end
	def currentuser
		currentuser=User.find(params[:id])
		if currentuser != current_user
			redirect_to user_path(current_user)
		end
	end
end

