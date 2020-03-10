class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy]

  def index
    # As a user, I can list tasks
    @tasks = Task.all
  end

  def show
    # As a user, I can view the details of a task
  end

  def new
    @task = Task.new
    # As a user, I can add a new task
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
  # As a user, I can edit a task (mark as completed / update title & details)
  end

  def destroy
    @task.destroy
    # @task.save
    redirect_to tasks_path
  # As a user, I can remove a task
  end

  def update
    @task.update(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def find_task
     @task = Task.find(params[:id])
  end
end
