class GoalsController < ApplicationController
  def index
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)

    @goal.save
    redirect_to root_path
  end

  private
  def goal_params
    params.require(:goal).permit(:goal_name, goal_number: [] , achievement_number: []).merge(user_id: current_user.id)
  end
end