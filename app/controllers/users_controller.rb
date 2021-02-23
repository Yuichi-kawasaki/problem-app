class UsersController < ApplicationController
  # before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
     @user = User.find(params[:id])
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path, notice: "マイプロフィールを編集しました！"
    else
      render :edit
    end
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
