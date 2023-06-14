class TasksController < ApplicationController
  
  def index
  end

  def new
    @tasks = Task.all
    @task =Task.new
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to root_path
    else
      @tasks = Task.all
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end


  private
  def task_params
    params.require(:task).permit(:title, :content, :start_time, :end_time, :mobile_id, :image).merge(user_id: current_user.id)
  end
end
