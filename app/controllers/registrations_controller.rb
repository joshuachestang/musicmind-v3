class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
  	if current_user.user_type == "music artist"
    new_fan_base_path
    else
    discover_path
    end
  end
end