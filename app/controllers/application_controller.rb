class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_current_year
  before_action :set_current_semester
  before_action :check_production

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

  def set_current_semester
    @set_current_semester = Config.first.current_semester
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

  # check production website
  def check_production
    if Rails.application.config.app_domain == 'http://localhost:3000/'
      @prod_check = false
    else
      @prod_check = true
    end
  end
end
