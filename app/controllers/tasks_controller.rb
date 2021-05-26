class TasksController < ApplicationController
  before_action :select_task, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all
  end

  def show; end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit; end

  def update
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  def select_task
    @task = Task.find(params[:id])
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end
end