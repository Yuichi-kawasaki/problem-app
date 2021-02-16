class ProblemsController < ApplicationController

  def index
    @problems = Problem.all
  end

  def show
    @problem = Problem.find(params[:id])
  end

  def new
    @problem = Problem.new
  end

  def edit
    @problem = Problem.find(params[:id])
  end

  def update
      problem = Problem.find(params[:id])
      problem.update!(problem_params)
      redirect_to problems_url, notice: "タスク「#{problem.title}」を更新しました"
    end

    def create
      problem = Problem.new(problem_params)
      problem.save!
      redirect_to problems_url, notice: "タスク「#{problem.title}」を完了しました。"
    end

    def destroy
      problem = Problem.find(params[:id])
      problem.destroy
      redirect_to problems_url, notice: "タスク「#{problem.title}」を消去しました"
    end

    private
    def problem_params
      params.require(:problem).permit(:title, :content)
    end
  end
