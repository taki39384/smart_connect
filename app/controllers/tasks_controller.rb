class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :show, :destroy]
  
  def index
    @tasks = Task.all
    @goals = Goal.all
  end

  def new
    @task =Task.new
  end

  def show
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
  end

  def update
    if @task.update(task_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @task.destroy
    redirect_to root_path
  end

  def search
    if params[:keyword].present?
      @tasks = Task.search(params[:keyword])
    else
      redirect_to root_path
    end
  end


  private
  def task_params
    params.require(:task).permit(:title, :content, :start_time, :end_time, :mobile_id, :image, tag_ids: []).merge(user_id: current_user.id)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
