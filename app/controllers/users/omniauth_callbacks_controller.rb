class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def facebook
      callback_for(:facebook)
    end
    # callback for twitter
    def twitter
      callback_for(:twitter)
    end

    def callback_for(provider)
        @user = User.from_omniauth(request.env["omniauth.auth"])
        if @user.persisted?
          sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
          set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
        else
          session["devise.#{provider}_data"] = request.env["omniauth.auth"].except("extra")
          redirect_to new_user_registration_url
        end
      end
    def failure
      redirect_to root_path
    end

  # def facebook
  #   @user = User.find_for_facebook(request.env['omniauth.auth'])
  #   if @user.persisted?
  #     sign_in_and_redirect @user, event: :authentication
  #     set_flash_message(:notice, :success, kind: "facebook") if is_navigational_format?
  #   else
  #     session['devise.facebook_data'] = request.env['omniauth.auth']
  #     redirect_to new_user_registration_url
  #   end
  # end
  #
  # # callback for twitter
  # def twitter
  #   @user = User.find_for_twitter(request.env['omniauth.auth'])
  #   if @user.persisted?
  #     sign_in_and_redirect @user, event: :authentication
  #     set_flash_message(:notice, :success, kind: "twitter") if is_navigational_format?
  #   else
  #     session['devise.twitter_data'] = request.env['omniauth.auth']
  #     redirect_to new_user_registration_url
  #   end
  # end
end
