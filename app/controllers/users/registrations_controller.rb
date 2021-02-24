class Users::RegistrationsController < Devise::RegistrationsController
  layout 'login/application'

  protected
    # # アカウント編集後、プロフィール画面に移動する
    # def after_update_path_for(resource)
    #   user_path(id: current_user.id)
    # end
    def update_resource(resource, params)
      resource.update_without_password(params)
    end

end
