class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
		@task = @user.tasks.build
		@tasks = @user.tasks.desc.page(params[:page])
    @toki = "asako"
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash.now[:success] = "welcome!"
			log_in @user
			redirect_to @user
		else
			render 'new'
		end

	end

	private

	def user_params
		params.require(:user).permit(:name,:email,:password,:password_confirmation)
	end

end
