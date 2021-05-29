class Users::RegistrationsController < Devise::RegistrationsController

  def after_update_path_for(resource)
    problems_path
  end

  protected
  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
