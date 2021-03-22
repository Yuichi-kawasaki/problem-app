class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
     @user = User.find(params[:id])
     # @problem = Problem.find(params[:id])
  end

  private
  def user_params
    accessible = [ :username, :email ]
    accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
    params.require(:user).permit(accessible)
  end
end
