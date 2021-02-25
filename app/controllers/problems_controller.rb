class ProblemsController < ApplicationController
  before_action :set_problem, only: [:show, :create, :edit, :update, :destroy]

  def index
    @problems = Problem.all
  end

  def show
    @problem = Problem.find(params[:id])
    @like = Like.new
  end

  def new
    if params[:back]
      @pproblem = Problem.new(problem_params)
    else
      @problem = Problem.new
    end
  end

  def edit
    @problem = Problem.find(params[:id])
  end

  def create
    @problem = Problem.new(problem_params)
    @problem.user_id = current_user.id
      if @problem.save
        redirect_back(fallback_location: root_path)
      else
        redirect_back(fallback_location: root_path)
      end
  end

  def update
    if @problem.update(problem_params)
      redirect_to problems_path, notice: "更新しました"
    else
      render :edit
    end
  end

  def destroy
    @problem.destroy
    redirect_to problems_path, notice: "消去しました"
  end

  private
  def set_problem
    @problem = Problem.find(params[:id])
  end

  def problem_params
    params.require(:problem).permit(:title, :content, :image, :image_cache)
  end
end
