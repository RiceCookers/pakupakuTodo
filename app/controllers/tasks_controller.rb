class TasksController < ApplicationController
  before_action :require_signed_in
  before_action :set_task, only: :update

  def index
    @tasks = current_user.tasks.opened.order(created_at: :asc)
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

  def update
    @task.assign_attributes task_params
    unless @task.save
      flash[:error] = "faild update"
    end
    redirect_to root_path
  end

  private

    def task_params
      params.require(:task).permit(:name, :state)
    end

    def set_task
      @task = current_user.tasks.find(params[:id])
    end
end
