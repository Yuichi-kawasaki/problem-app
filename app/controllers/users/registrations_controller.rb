class Users::RegistrationsController < Devise::RegistrationsController
  layout 'login/application'

  # def edit
  #   @user = User.find(params[:id])
  #   if @user == current_user
  #     render "edit"
  #   else
  #     redirect_to problems_path
  #   end
  # end

end
