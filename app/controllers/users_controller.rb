class UsersController < ApplicationController
  # before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: :finish_signup
  def show
     @user = User.find(params[:id])
  end
  # def edit
  #   @user = User.find(params[:id])
  #   if @user == current_user
  #     render "edit"
  #   else
  #     redirect_to problems_path
  #   end
  # end
  # def update
  #   @user = current_user
  #   if @user.update(user_params)
  #     redirect_to user_path, notice: "マイプロフィールを編集しました！"
  #   else
  #     render :edit
  #   end
  # end

  def finish_signup
    @user = User.find(params[:id])
    if request.patch? && @user.update(user_params)
      @user.send_confirmation_instructions unless @user.confirmed?
      flash[:info] = 'We sent you a confirmation email. Please find a confirmation link.'
      redirect_to root_url
    end
  end

  private

      # user_paramsにアクセスするため。
      def user_params
        accessible = [ :username, :email ]
        accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
        params.require(:user).permit(accessible)
      end
  # def destroy
  #   @problem.destroy
  #   redirect_to problems_path, notice:"投稿を削除しました！"
  # end
  #
  # # def confirm
  # # end
  #
  # private
  # # def set_user
  # #   @user = User.find(params[:id])
  # # end
  #
  # def user_params
  #   params.require(:user).permit(:name, :email, :password ,:image, :gender,
  #                                :city, :prefecture, :profession, :occupation, :profile, :created_at, :updated_at)
  # end
end
