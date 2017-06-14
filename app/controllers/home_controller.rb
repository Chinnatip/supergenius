class HomeController < ApplicationController

  require 'json'
  require 'open-uri'
  require 'nokogiri'
  require_relative 'scrap'

  def celebrity
    render :layout => 'standalone'
  end

  def index
    @active = 'index'
    @quote  = 'PSH'
    @stock_data = parse_set(@quote)[0]
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

  def class_detail
    @seats   = Seat.where(classroom: params[:id])
    @periods = Classroom.where(spec: params[:id]).first[:period] + 1
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
