class HomeController < ApplicationController
  def index
  end

  def test
  end

  def portfolio
    @filter = params[:filtered]
  end

  def playground


  end
end
