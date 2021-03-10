class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
   attr_accessor :access_token, :access_secret, :credentials, :name

  def facebook; basic_action; end
  def google; basic_action; end

  private
  def basic_action
    @omniauth = request.env['omniauth.auth']
      if @omniauth.present?
        @profile = SocialProfile.where(provider: @omniauth['provider'], uid: @omniauth['uid']).first
        unless @profile
          @profile = SocialProfile.where(provider: @omniauth['provider'], uid: @omniauth['uid']).new
          @profile.user = current_user || User.create!(name: @omniauth['name'], email: dammy_mail, password: dammy_password)
          @profile.save!
        end
        if current_user
          flash[:notice] = "外部アプリケーションとの連携が完了しました" if current_user == @profile.user
          flash[:alert] = "このアカウントは他のユーザーによって連携されています" if current_user != @profile.user
        else
          sign_in(:user, @profile.user)
        end
          @profile.set_values(@omniauth)
      end
        flash[:success] = "ログインしました。"
        redirect_to root_path
    end

    def dammy_mail
      dammy_mail = "hoge@example.com"
      return dammy_mail
    end

    def dammy_password
      dammy_password = "000000"
      return dammy_password
    end
end
