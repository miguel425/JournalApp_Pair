class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]


  # GET /tasks or /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    # @task = Task.new
    @task = current_user.categories.tasks.build
  end

  # GET /tasks/1/edit
  def edit
    @category = Category.find(params[:category_id])
    @task = @category.tasks.find(params[:id])
  end

  # POST /tasks or /tasks.json
  def create
    @category = current_user.categories.find(params[:category_id])
    @task = @category.tasks.create(task_params)
    redirect_to category_path(@category)
    
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    if @task.update(task_params)
      redirect_to @category
    else render :edit
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @category = current_user.categories.find(params[:category_id])
    @task = @category.tasks.find(params[:id])
    @task.destroy
    redirect_to category_path(@category)
  end

  def correct_user
    @category = current_user.categories.find(params[:category_id])
    redirect_to categories_path, notice: "Not authorized to perform this action."  if @category.nil?
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:header, :description, :category_id, :deadline)
    end
end
