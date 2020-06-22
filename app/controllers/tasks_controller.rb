class TasksController < ApplicationController

  def index
  	@tasks
  	# for var in User.all do
  	# 	@tasks = var.tasks
  	# end
  	@user = User.all
  end

  def mypage
  	@tasks = current_user.tasks
  end

  def new
  	@task = Task.new
  end

  def create
	@task = current_user.tasks.new task_params
	@task.save!
	redirect_to tasks_url
  end

  private
  def target_task task_id
    current_user.tasks.where(id: task_id).take
  end

  def task_params
    params.require(:task).permit(:title, :description)
  end

end
