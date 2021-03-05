class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
   def facebook; basic_action; end
   def twitter; basic_action; end

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
      redirect_to user_path(current_user)
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
  #
  #   # いくつプロバイダーを利用しようが処理は共通しているので本メソッドをエイリアスとして流用。
  #   def callback_for_all_providers
  #     unless request.env["omniauth.auth"]
  #       flash[:danger] = "Authentication data was not provided"
  #       redirect_to root_url and return
  #     end
  #     provider = __callee__.to_s
  #     user = request.env["omniauth.auth"]
  #     # user = OAuthService::GetOAuthUser.call(env["omniauth.auth"])
  #     # ユーザーがデータベースに保存されており、且つemailを確認済みであれば、ユーザーをログインする。
  #     if user.persisted? && user.email_verified?
  #       sign_in_and_redirect user, event: :authentication
  #       set_flash_message(:notice, :success, kind: provider.capitalize) if is_navigational_format?
  #     else
  #       user.reset_confirmation!
  #       flash[:warning] = "We need your email address before proceeding."
  #       redirect_to finish_signup_path(user)
  #     end
  #   end
  #   alias_method :facebook, :callback_for_all_providers
  #   alias_method :twitter,  :callback_for_all_providers
  # end
