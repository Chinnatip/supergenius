class InvestorController < ApplicationController

  require 'json'
  require 'open-uri'
  require 'nokogiri'
  require_relative 'scrap'
  layout 'investor'

  def index
    @active = 'index'
    @quote  = 'PSH'
    @stock_data = parse_set(@quote)[0]
  end

  def financial
    @active = 'financial'
  end

  # share group
  def share
    @active = 'share'
  end
  def share_right
    @active = 'share'
  end
  def share_history
    @active = 'share'
  end
  def share_holder
    @active = 'share'
  end

  #bond group
  def bond
    @active = 'bond'
  end
  def bond_policy
    @active = 'bond'
  end

  #stock group
  def stock
    @active = 'stock'
    @quote  = 'PSH'
    @stock_data = parse_set(@quote)[0]
  end
  def stock_history
    @active = 'stock'
  end
  def stock_cap
    @active = 'stock'
  end
  def stock_concensus
    @active = 'stock'
  end
  def stock_analyst
    @active = 'stock'
  end


  #news group
  def news
    @active = 'news'
  end
  def news_set
    @active = 'news'
  end
  def news_calendar
    @active = 'news'
  end

  #contact group
  def contact
    @active = 'contact'
  end
  def contact_email
    @active = 'contact'
  end

end
