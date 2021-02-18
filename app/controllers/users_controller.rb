class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
      @user = User.new(user_params)
      if @user.save
        redirect_to user_path(@user.id), notice: "アカウント作成しました"
      else
        render :new if @user.invalid?
      end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "マイプロフィールを編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @problem.destroy
    redirect_to problems_path, notice:"投稿を削除しました！"
  end

  def confirm
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password ,:icon, :gender,
                                 :city, :prefecture, :profession, :occupation, :profile, :created_at, :updated_at)
  end
end
