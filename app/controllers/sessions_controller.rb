class SessionsController < ApplicationController
  def index
  end

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      remember user
    # redirect_to user_path(user.id)
      redirect_to problems_path(current_user)
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end

    unless request.env['omniauth.auth'][:uid]
      flash[:danger] = '連携に失敗しました'
      redirect_to root_url
    end
    user_data = request.env['omniauth.auth']
    user = User.find_by(uid: user_data[:uid])
    if user
      log_in user
      flash[:success] = 'ログインしました'
      redirect_to root_url
    else
      new_user = User.new(
        uid: user_data[:uid],
        nickname: user_data[:info][:nickname],
        name: user_data[:info][:name],
        image: user_data[:info][:image],
      )
      if new_user.save
        log_in new_user
        flash[:success] = 'ユーザー登録成功'
      else
        flash[:danger] = '予期せぬエラーが発生しました'
      end
      redirect_to root_url
    end
  end

    def destroy
      session.delete(:user_id)
      flash[:notice] = 'ログアウトしました'
      redirect_to new_session_path
    end
end
