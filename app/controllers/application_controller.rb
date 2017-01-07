class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    home_index_path
  end

  # Overwriting the sign_out redirect path method
  def after_sign_in_path_for(resource_or_scope)
    if current_user.role == 'admin'
      dashboard_index_path
    else
      home_index_path
    end
  end
end
