class TasksController < ApplicationController

	before_action :logged_in_user, only: [:create, :destroy]
	before_action :corretct_user, only: [:edit, :update, :destroy]

	def index
	end

	def show
		@task = Task.find(params[:id])
	end

	def create
		@task = current_user.tasks.build(task_params)
		if @task.save
			flash[:success] = "タスクを作成しました"
			redirect_to current_user
		else
			flash[:danger] = "タスク内容を入力してください"
			redirect_to current_user
		end
	end


	def edit
	end

	def update
		if @task.update_attributes(task_params)
			flash[:success] = "タスクを更新しました"
			redirect_to current_user
		else
			render 'edit'
		end
	end

	def destroy
		@task.destroy
		flash[:success] = "タスクを削除しました"
		redirect_to request.referrer || current_user
	end

	private

		def task_params
			params.require(:task).permit(:content)
		end

		def corretct_user
			@task = current_user.tasks.find_by(id: params[:id])
			redirect_to current_user if @task.nil?
		end

end
