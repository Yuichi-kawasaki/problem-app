class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
     @user = User.find(params[:id])
     # if params[:back]
     #   @problem = Problem.new(problem_params)
     # else
     #   @problem = Problem.new
     # end
  end

  private
  def user_params
    accessible = [ :username, :email ]
    accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
    params.require(:user).permit(accessible)
  end
end
