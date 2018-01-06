class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_current_year

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end

  def set_current_year
    @set_current_year = Config.first.current_year
  end

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    # home_index_path
    Rails.application.config.app_domain + '#navbar'
  end

  # Overwriting the sign_out redirect path method
  def after_sign_in_path_for(resource_or_scope)
    if current_user.role == 'admin'
      dashboard_index_path
    else
      # home_index_path
      Rails.application.config.app_domain + '#navbar'
    end
  end
end
