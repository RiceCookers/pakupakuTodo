class TasksController < ApplicationController
  before_action :require_signed_in

  def index
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new task_params.merge(user: current_user)
    if @task.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

    def task_params
      params.require(:task).permit(:name, :state)
    end
end
