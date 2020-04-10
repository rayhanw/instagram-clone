class Users::RegistrationsController < Devise::RegistrationsController
  def after_update_path_for(resource)
    user_path(resource.username)
  end
end
