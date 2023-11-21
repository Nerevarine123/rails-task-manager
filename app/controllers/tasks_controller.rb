class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @tasks = Task.all
  end

  def show
   # @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    # redirect_to prefix_path
    redirect_to tasks_path(@task)
  end

  def edit
    # @restaurant = Restaurant.find(params[:id])
  end

  def update
    # Find the restaurant you want to update
    # @restaurant = Restaurant.find(params[:id])
    # Update the restaurant
    @task.update(task_params)
    redirect_to tasks_path(@task)
  end

  def destroy
    # Find restaurant to be destroyed
    # @restaurant = Restaurant.find(params[:id])
    # Destroy it!
    @task.destroy
    # redirect_to someprefix_path
    redirect_to tasks_path(@task)
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
