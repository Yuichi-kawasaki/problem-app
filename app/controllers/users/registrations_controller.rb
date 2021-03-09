class Users::RegistrationsController < Devise::RegistrationsController
  layout 'login/application'


  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
