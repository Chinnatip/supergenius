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

  def comp
  end

  def single
  end

  def reddit
    @posts = [
      {
        vote: 12,
        title: 'megan fox'
      },{
        vote: 120,
        title: 'femininegirls'
      },{
        vote: 47,
        title: 'superman in the sky'
      },
    ]
  end
end
