class DashboardController < ApplicationController
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
