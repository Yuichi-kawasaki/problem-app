class Users::SessionsController < Devise::SessionsController
  layout 'login/application'
  #
  def new
    @user = User.new
  end


end
