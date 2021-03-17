class ProblemsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create, :edit, :index, :destroy]
  before_action :ensure_correct_user, only:[:edit, :destroy]
  helper_method :sort_column, :sort_direction

  def index
    @problems = Problem.order(id: :DESC)
    @problem = current_user.problems.build

    @search_params = problem_search_params
    @problems = Problem.search(@search_params)


    @problems = @problems.joins(:labels).where(labels: { id: params[:label_id] }) if params[:label_id].present?

    @problems = @problems.page(params[:page]).per(5)
  end

  def show
    @problem = Problem.find(params[:id])
    @like = Like.new
    @comment = Comment.new
    @comments = @problem.comments.order(created_at: :desc)
  end

  def new
    if params[:back]
      @pproblem = Problem.new(problem_params)
    else
      @problem = Problem.new
    end
  end

  def edit
    #@problem = Problem.find(params[:id])
    if @problem.user_id == current_user.id
      render 'edit'
    else
      redirect_to problems_path
    end
  end

  def create
    @problem = Problem.new(problem_params)
    @problem.user_id = current_user.id
      if @problem.save
        redirect_to problems_path, notice: "投稿しました！"
      else
        render :index
      end
  end

  def update
    @problem = current_user.problems.find(params[:id])
    if @problem.update(problem_params)
      redirect_to problems_path, notice: "更新しました"
    else
      redirect_to problems_path
    end
  end

  def destroy
    @problem.destroy
    redirect_to problems_path, notice: "消去しました"
  end

  def sort_direction
   %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end

  def sort_column
   Problem.column_names.include?(params[:sort]) ? params[:sort] : 'title'
  end

  private
  # def set_problem
  #   @problem = current_user.problems.find(params[:id])
  # end
  def ensure_correct_user
   @problem = Problem.find(params[:id])
    unless @problem.user == current_user
    redirect_to problems_path, notice: "投稿ユーザー以外、編集・消去はできません"
  end
 end
  def problem_params
    params.require(:problem).permit(:title, :content, :image, :image_cache, { label_ids: [] })
  end
  def problem_search_params
    params.fetch(:search, {}).permit(:title,{ label_ids: [] })
  end
end
