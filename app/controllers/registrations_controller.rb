class RegistrationsController < Devise::RegistrationsController
  layout 'login/application'

  # def edit
  #   @user = User.find(params[:id])
  #   if @user == current_user
  #     render "edit"
  #   else
  #     redirect_to problems_path
  #   end
  # end

  protected
    # def after_update_path_for(resource)
    #   user_path(id: current_user.id)
    # end
    def update_resource(resource, params)
      resource.update_without_password(params)
    end

end
