class DashboardController < ApplicationController
  # authenticate user before load pages
  before_action :authenticate_user!

  def index
    @active = 'index'
  end

  def new
    @active = 'new'
  end

  def board
    @active = 'board'
  end

  def product
    @active = 'product'
  end
end
