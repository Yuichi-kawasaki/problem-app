class CommentsController < ApplicationController
  def create
    @problem = Problem.find(params[:problem_id])
    @comment = @problem.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    render :index
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    render :index
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :image, :problem_id, :user_id)
  end
end
