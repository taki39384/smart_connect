class TasksController < ApplicationController
  
  def index
    @tasks = Task.all
  end

  def new
    @tasks = Task.all
    @task =Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to root_path
    else
      render :new
    end
  end


  private
  def task_params
    params.require(:task).permit(:title, :content, :start_time, :mobile_id).merge(user_id: current_user.id)
  end
end
