class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
      problems_path
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :email, :password ,:image, :gender,
                                 :city, :prefecture, :profession, :occupation,  :created_at, :updated_at])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile, :email, :password ,:image, :gender,
                                 :city, :prefecture, :profession, :occupation,  :created_at, :updated_at])
  end
end
