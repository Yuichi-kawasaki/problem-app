class HomesController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @problems = Problem.order(id: :DESC)

    @search_params = problem_search_params
    @problems = Problem.search(@search_params)
    @problems = @problems.joins(:labels).where(labels: { id: params[:label_id] }) if params[:label_id].present?

    @problems = @problems.page(params[:page]).per(3)
  end

  def sort_direction
   %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end

  def sort_column
   Problem.column_names.include?(params[:sort]) ? params[:sort] : 'title'
  end

  private
  def problem_params
    params.require(:problem).permit(:title, :content, :image, :image_cache, { label_ids: [] })
  end
  def problem_search_params
    params.fetch(:search, {}).permit(:title,{ label_ids: [] })
  end
end