class DashboardController < ApplicationController
  # authenticate user before load pages
  before_action :authenticate_user!

  def index
    @active = 'classrooms'
  end

  def current_course
    @hello = "world"
  end
end
